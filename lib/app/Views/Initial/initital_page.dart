import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/Initial/Controller/initial_controller.dart';
import 'package:ilovemarajo/app/Views/Initial/Models/municipio.dart';
import 'package:ilovemarajo/app/Views/Initial/Widgets/municipios_nome.dart';
import 'package:mobx/mobx.dart';


class InitialPage extends StatefulWidget {
  @override
  _InitialPageState createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {

  InitialController controller = InitialController();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      controller.pegarDadosMunicipio().catchError((e){
        return ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 20),
              content: Text(e.toString())));
        });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.blue,BlendMode.color),
                    fit: BoxFit.cover,
                    image: AssetImage(
                      'image/fundos/login.PNG'))),
          ),
          Center(
              child: AutoSizeText(
                'Ilove \nMarajó',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 60.0))),

          DraggableScrollableSheet(
              initialChildSize: 0.35,
              maxChildSize: 0.5,
              minChildSize: 0.3,
              builder: (context,controlador){
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)
                      )
                    ),
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      PhysicalModel(
                        color: Colors.black,
                        elevation: 8.0,
                        borderRadius: BorderRadius.circular(52),
                        child: Container(
                          height: 60,
                          width: 200,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Center(
                              child: AutoSizeText(
                                'Escolha o municipio',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white,fontSize: 34.0),)),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 60),
                        child: StreamBuilder<List<MunicipioModel>>(
                          stream: controller.dados.stream,  
                          builder: (context, snapshot) {
                                if(snapshot.hasError){
                                  return Center(
                                    child: Text(
                                      'Error inesperado :(',
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  );
                                }else if(!snapshot.hasData){
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                List<MunicipioModel>? dados = snapshot.data;
                                if(dados!.isEmpty){
                                  return Center(
                                    child: Text('Sem municipios :)'),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: dados.length,
                                  controller: controlador,
                                  itemBuilder: (context,index){
                                    return NomesMunicipios(
                                      dados[index]
                                    );
                                  },
                                );
                          }
                        )
                      )
                      
                    ],
                  )
                );
              }
          )
        ],
      ),
    );
  }


}
