import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Shared/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Views/Initial/initital_page.dart';
import 'package:ilovemarajo/app/Views/Liquid/liquid_page.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Myapp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String,WidgetBuilder>{
        '/tela1': (BuildContext context) => LiquidPage(),
      },
      debugShowCheckedModeBanner: false,
      builder: (context,widget)=>ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context,widget!),
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
        ]
        ),
      home: Validacao()  
    );
  }
}

class Validacao extends StatefulWidget {
  @override
  _ValidacaoState createState() => _ValidacaoState();
}

class _ValidacaoState extends State<Validacao> {

  final GoogleLoginController _googleControllerPage = GoogleLoginController();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _googleControllerPage.verifyUser();
    }
  @override
  Widget build(BuildContext context) {
    if(_googleControllerPage.validadeUser){
      return InitialPage();
    }
    return LiquidPage();
  }
}