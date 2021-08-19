import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilovemarajo/app/Shared/Widgets/icon_widget.dart';
import 'package:ilovemarajo/app/Shared/Widgets/showDialogTwoButtons.dart';
import 'package:ilovemarajo/app/Shared/controller/google_login/google_controller.dart';
import 'package:ilovemarajo/app/Shared/enums/categorias_enums.dart';
import 'package:ilovemarajo/app/modules/home/controller/home_controller.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/categoria_page.dart';
import 'package:ilovemarajo/app/modules/home/widgets/lista_widget_popular.dart';
import 'package:ilovemarajo/app/modules/initial/models/municipio.dart';

class HomePage extends StatefulWidget {
  final MunicipioModel dadosMuncipio;
  HomePage(this.dadosMuncipio);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  GoogleLoginController _googleControllerPage = GoogleLoginController();
  
  @override
  void initState() {
    super.initState();
    _googleControllerPage.verifyUser();
  }

  void actionButtonShow(context)async{
    await _googleControllerPage.logoutGoogle();
    Navigator.of(context).popAndPushNamed('/auth');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
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
                      ShaderMask(
                        shaderCallback: (_){
                          return RadialGradient(
                            center: Alignment.centerRight,
                            radius: 1.0,
                            tileMode: TileMode.mirror,
                            colors: [
                              Colors.green,
                              Colors.blue,
                            ]
                          ).createShader(_);
                        },
                        child: Text(
                          'Ilove Marajó',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
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
                    ),
                  ],
                ),
              );
            }
          ),

          Observer(
            builder: (context) {
              return Align(
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
              );
            }
          ),

          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 30),
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
                      MaterialPageRoute(builder: (_)=> CategoriaPage(
                        categoriaEnum: CategoriaEnum.praias,
                        municipioModel: widget.dadosMuncipio,
                      ))
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
            padding: const EdgeInsets.only(left: 20,top: 30,bottom: 20),
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
       ),
      ),
    );
  }
}
