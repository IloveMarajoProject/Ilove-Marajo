import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Widgets/ListaWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Ilove Marajó',style: TextStyle(color: Colors.black),),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(Icons.share), 
            onPressed: (){})
        ],
      ),
      drawer: Drawer(),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: AutoSizeText(
              'Pontos Turisticos',
              maxLines: 1,
              style: TextStyle(
                fontSize: 24
              ),
              ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: [
                  ListaWidget(),
                  ListaWidget(),
                  ListaWidget(),
                  ListaWidget(),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
