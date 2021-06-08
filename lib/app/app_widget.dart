import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesApoio/praia_page.dart';
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
  bool? validacao;

  Future<bool?> getPageLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      validacao = prefs.getBool('validar');
      print(validacao.toString());
    });
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getPageLogin();
    }
  @override
  Widget build(BuildContext context) {
    if(validacao == true){
      return InitialPage();
    }
    return LiquidPage();
  }
}