import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListaWidget extends StatefulWidget {
  @override
  _ListaWidgetState createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        _container(),
        _container(),
        _container(),
      ],
    );
  }


  Widget _container(){
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30,horizontal: 10),
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('image/fundos/login.PNG')
        )
      ),

      child: Stack(
        children: [

          //Local aonde a ponto está, pode ser a uma vila ou cidade e etc...
          //Não é o municipio
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(2)
              ),
              child: AutoSizeText(
                'Salvaterra',
                style: TextStyle(fontSize: 15),
                ),
            ),
          ),


          //Nome do ponto turistio
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: AutoSizeText(
                'Praia Grande',
                maxLines: 2,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white
                ),
                ),
            ),
          )
        ],
      ),
    );
  }
}