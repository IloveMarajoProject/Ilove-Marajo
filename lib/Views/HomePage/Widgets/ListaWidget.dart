import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ListaWidgets extends StatefulWidget {
  int? indexHome;
  int? indexPage;
  String? imageURL;
  ListaWidgets({this.indexHome,this.indexPage,this.imageURL});
  @override
  _ListaWidgetsState createState() => _ListaWidgetsState();
}

class _ListaWidgetsState extends State<ListaWidgets> {
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: widget.indexPage == widget.indexHome ? 1.0 : 0.9,
      child: GestureDetector(
        onTap: (){
          print("Deu certo");
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('image/fundos/login.PNG'),
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
              "Praia Grande de Salvaterra",
              maxLines: 1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}