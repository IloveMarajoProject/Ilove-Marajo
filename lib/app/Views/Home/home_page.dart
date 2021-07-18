import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilovemarajo/app/Shared/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Shared/Controller/SharedPreference/shared_preference.dart';
import 'package:ilovemarajo/app/Shared/Widgets/icon_widget.dart';
import 'package:ilovemarajo/app/Shared/Widgets/showDialogTwoButtons.dart';
import 'package:ilovemarajo/app/Views/Home/Controller/home_controller.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/praia_page.dart';
import 'package:ilovemarajo/app/Views/Home/Widgets/lista_widget_popular.dart';
import 'package:ilovemarajo/app/Views/Initial/Models/municipio.dart';

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
    super.initState();
    _googleControllerPage.verifyUser();
  }
  @override
    void dispose() {
      controller.editingController.dispose();
      super.dispose();
    }

  void actionButtonShow(context)async{
    await _googleControllerPage.logoutGoogle();
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
                                onPressed: () async {
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
                              text: ' ${_googleControllerPage.currentUser?.displayName}!!\n',
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
