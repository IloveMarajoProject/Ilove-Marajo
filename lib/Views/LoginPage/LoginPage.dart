import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Componentes/ListaMunicipios.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
                  style: GoogleFonts.archivoBlack(color: Colors.white,fontSize: 60.0),)),
          ),

          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.50,
              minChildSize: 0.3,
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
                        padding: EdgeInsets.only(top: 70),
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
