import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/Views/InfoPage/InfoPage.dart';

class ListaWidgets extends StatefulWidget {
  String? nome;
  String? perfil;
  ListaWidgets({this.nome,this.perfil});
  @override
  _ListaWidgetsState createState() => _ListaWidgetsState();
}

class _ListaWidgetsState extends State<ListaWidgets> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: MediaQuery.of(context).size.height - 250,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.perfil.toString()),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(2, 3),
                )
              ]),
        ),
        AutoSizeText(
          widget.nome.toString(),
          maxLines: 1,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}