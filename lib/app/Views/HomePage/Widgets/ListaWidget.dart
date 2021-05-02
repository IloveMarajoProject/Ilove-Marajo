import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/InfoPage.dart';

class ListaWidgets extends StatefulWidget {
  final PraiaModel praiaModel;
  final FocusNode node;
  ListaWidgets(this.praiaModel,this.node);
  @override
  _ListaWidgetsState createState() => _ListaWidgetsState();
}

class _ListaWidgetsState extends State<ListaWidgets> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: (){
        widget.node.unfocus();
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context)=> InfoPage(widget.praiaModel))
        );
      },
      child: Container(
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 7,
              offset: Offset(5, 8), // changes position of shadow
            ),         
          ],
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(widget.praiaModel.foto.toString())
          )
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20,bottom: 30,top: 140),
                child: AutoSizeText(
                  widget.praiaModel.nomePraia.toString(),
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}