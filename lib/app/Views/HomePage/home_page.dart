import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ilovemarajo/app/Util/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Util/Controller/SharedPreference/shared_preference.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Util/Widgets/showDialog.dart';
import 'package:ilovemarajo/app/Util/Widgets/showDialogTwoButtons.dart';
import 'package:ilovemarajo/app/Views/HomePage/Controller/home_controller.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/Drawer/drawer.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/info_page.dart';
import 'package:ilovemarajo/app/Views/HomePage/Widgets/Template/praia_page.dart';
import 'package:ilovemarajo/app/Views/HomePage/Widgets/icon_widget.dart';
import 'package:ilovemarajo/app/Views/HomePage/Widgets/lista_widget_popular.dart';
import 'package:ilovemarajo/app/Views/InitialPage/Models/municipio.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  final MunicipioModel dadosMuncipio;
  HomePage(this.dadosMuncipio);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  HomeController controller = HomeController();
  GoogleLoginController _googleControllerPage = GoogleLoginController();
  SharedPreferenceController _preferenceController = SharedPreferenceController();
    @override
    void initState() {
      // TODO: implement initState
      super.initState();
      FirebaseAuth.instance
        .authStateChanges()
        .listen((user) {
          setState(() {
           _googleControllerPage.setUser(user);            
          });
        });
    }
  @override
    void dispose() {
      controller.editingController.dispose();
      super.dispose();
    }

  void actionButtonShow(context)async{
    await _googleControllerPage.logoutGoogle();
    _preferenceController.loginClose();
    Navigator.of(context).popAndPushNamed('/tela1');
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
       body: Builder(
         builder:(context)=> Form(
           key: controller.validacao,
           child: SafeArea(
             child: Column(
               mainAxisSize: MainAxisSize.min,
               children: [
                  Observer(
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                              IconButton(
                                icon: Icon(Icons.logout),
                                iconSize: 35,
                                onPressed: (){
                                  showDialog(
                                    context: context, 
                                    builder: (context){
                                      return ShowDialogTwoButtonGlobal(
                                        titulo: 'Aviso:',
                                        texto: 'Deseja mesmo sair da sua conta ?',
                                        botaoAction: actionButtonShow,
                                        nomeBotao: 'Continuar',
                                      );
                                    }
                                  );
                                },
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: Image.network('${_googleControllerPage.currentUser?.photoURL.toString()}',
                                  fit: BoxFit.cover,
                                  height: 50,
                                  width: 50,
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                                    return CircularProgressIndicator();
                                  },
                              ),
                            )
                          ],
                        ),
                      );
                    }
                  ),

                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Bem vindo,',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue
                              ),
                            ),
                            TextSpan(
                              text: ' ${_googleControllerPage.currentUser?.displayName.toString()}!!\n',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                            TextSpan(
                              text: 'O que você está procurando ?',
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

                  Padding(
                    padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconWidgetPontos(
                          icone: Icons.beach_access,
                          nome: 'Praias',
                          containerColor: Colors.blueAccent[100],
                          iconeColor: Colors.blue[900],
                          ontap: (){
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_)=>PraiaPage(widget.dadosMuncipio))
                            );
                          },
                        ),
                        IconWidgetPontos(
                          icone: Icons.apartment,
                          nome: 'Pousadas',
                          containerColor: Colors.greenAccent[100],
                          iconeColor: Colors.green[900],
                          ontap: (){},
                        ),
                        IconWidgetPontos(
                          icone: Icons.fastfood,
                          nome: 'Restaurantes',
                          containerColor: Colors.orange[100],
                          iconeColor: Colors.orange[900],
                          ontap: (){},
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 40,bottom: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Lugares populares',
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.black45,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          ListaWidgetPopular(),
                          ListaWidgetPopular(),
                          ListaWidgetPopular(),
                        ],
                      )
                    ),
                  )
               ],
             )),
         ),
       ),
      ),
    );
  }
}
