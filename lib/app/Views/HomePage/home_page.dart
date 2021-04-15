import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/HomePage/Controller/home_controller.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/InfoPage.dart';
import 'package:mobx/mobx.dart';
import 'Widgets/ListaWidget.dart';

class HomePage extends StatefulWidget {
  final String municipio;
  HomePage(this.municipio);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  HomeController controller = HomeController();
  
  FocusNode focusNode = new FocusNode();
  @override
    void dispose() {
      controller.editingController.dispose();
      super.dispose();
    }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       body: Form(
         key: controller.validacao,
         child: SafeArea(
           child: Column(
             children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(Icons.sort),
                        iconSize: 35,
                        onPressed: (){},
                      ),

                      CircleAvatar()
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Bem vindo!!\n',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue
                            ),
                          ),
                          TextSpan(
                            text: 'Onde você gostaria de ir?',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                ),
                Observer(
                  builder: (_){
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Flexible(
                            child: TextFormField(
                              focusNode: focusNode,
                              controller: controller.editingController,
                              onChanged: (value){
                                controller.setPesquisa(value);
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10)),
                                  ),
                                  hintText: 'Pesquise o nome do local',
                                ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: IconButton(
                              iconSize: 40,
                              icon: Icon(Icons.search),
                              onPressed: controller.isButtonActivate ?(){
                                controller.editingController.clear();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(controller.pesquisa.toString()))
                                  );
                                focusNode.unfocus();
                                controller.removePesquisa();
                              }
                              :
                              null
                            ),
                          )
                        ],
                      ),
                    );
                  }
                ),
                TabBar(
                  labelColor: Colors.black,
                  tabs: [
                    Tab(icon: Icon(Icons.beach_access), text: 'Praias',),
                    Tab(icon: Icon(Icons.apartment), text: 'Pousadas',),
                    Tab(icon: Icon(Icons.fastfood), text: 'Restaurantes',),
                  ]
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      _pegarStreamNoTabBar('Praias'),
                      _pegarStreamNoTabBar('Pousadas'),
                      _pegarStreamNoTabBar('Restaurantes'),
                    ]
                  ),
                )
             ],
           )),
       ),
      ),
    );
  }


  _pegarStreamNoTabBar(String colletion){
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance.collection('Municipios').doc(widget.municipio).collection(colletion).snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasError){
          return Center(
            child: Text('Erro inesperado :('),
          );
        }else if(!snapshot.hasData){
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.red,
            ),
          );
        }
        List<DocumentSnapshot>? documentos = snapshot.data?.docs.toList();
        if(documentos!.isEmpty){
          return Center(
            child: Text('Sem dados cadastrados :)'),
          );
        }
        return ListView.builder(
          itemCount: documentos.length,
          itemBuilder: (context,index){
            return ListaWidgets(documentos[index],focusNode);
          },
        );
      }
    );
  }
}
