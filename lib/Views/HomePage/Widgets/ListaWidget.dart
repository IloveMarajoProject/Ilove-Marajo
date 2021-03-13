import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hexcolor/hexcolor.dart';
class ListaWidget extends StatefulWidget {
  @override
  _ListaWidgetState createState() => _ListaWidgetState();
}

class _ListaWidgetState extends State<ListaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      height: 270,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('image/fundos/login.PNG')
        )
      ),

      child: Stack(
        children: [

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)
                )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      'Praia Grande',
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20),
                      )),

                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "4.5",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20)
                        ),
                        WidgetSpan(
                          child: Icon(
                            Icons.star,
                            size: 20,
                            color: Colors.white,
                            ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}