import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/Api/Api.dart';
import 'package:ilovemarajo/Api/MunicipioModel.dart';
import 'package:ilovemarajo/Api/ProdutosModel.dart';
import 'package:ilovemarajo/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/Views/HomePage/HomePage.dart';
import 'package:hasura_connect/hasura_connect.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  StreamController _controller = StreamController();

  //Inicializa o servidor com a URL
  HasuraConnect hasuraConnect = HasuraConnect(HASURA_URL);


  //variavel que pega o retorno do metodo #hasura_GetdadosMunicipios# para poder listar os municipios
  var municipio;

  //Metodo que pega os dados do servidor
  hasura_GetdadosMunicipios()async{
    Snapshot snapshot = await hasuraConnect.subscription(subQuery);
      snapshot.listen((data) {
        municipio = data["data"]["Municipios"];
        _controller.add(municipio);
        print(municipio);
      }).onError((err) {
        print(err);
      });
  }
  
  @override
    void initState() {
      super.initState();
      hasura_GetdadosMunicipios();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('image/fundos/login.PNG'))),
          ),
          Flexible(
            child: Center(
                child: AutoSizeText(
                  'Ilove \nMarajó',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white,fontSize: 60.0),)),
          ),

          DraggableScrollableSheet(
              initialChildSize: 0.2,
              maxChildSize: 0.30,
              minChildSize: 0.2,
              builder: (context,controlador){
                return Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))),
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
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: Flexible(
                            child: Center(
                                child: AutoSizeText(
                                  'Escolha o municipio',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white,fontSize: 34.0),)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 40),

                        ///StreamBuilder
                        child: StreamBuilder(
                          stream: _controller.stream,  
                          builder: (context, snapshot) {
                                if(snapshot.hasError){
                                  return Center(
                                    child: Text('Erro inesperado :('),
                                  );
                                }else if(!snapshot.hasData){
                                  return Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return ListView.builder(
                                  itemCount: municipio.length,
                                  controller: controlador,
                                  itemBuilder: (context,index){

                                    //Retorna a lista com os nomes dos municipios
                                    return Padding(
                                      padding: const EdgeInsets.only(bottom: 10),
                                      child: GestureDetector(
                                        child: Flexible(
                                          child: Center(
                                              child: AutoSizeText(
                                                  municipio[index]["nome"],
                                                  style: TextStyle(
                                                      fontSize: 26.0,
                                                      fontWeight: FontWeight.w700,
                                                      color: Colors.green
                                                  )
                                              )),
                                        ),
                                        onTap: (){
                                          Navigator.of(context)
                                            .push(MaterialPageRoute(builder: (context)=>HomePage(
                                              id:municipio[index]["id"],
                                            )));
                                        },
                                      ),
                                    );
                                    ///////////////////////////////////////////////
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
