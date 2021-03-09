import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            child: AutoSizeText(
              'Pontos Turisticos',
              maxLines: 1,
              style: TextStyle(
                fontSize: 24
              ),
              )),
          Flexible(
            child: AutoSizeText(
              'Hoteis e pousadas',
              maxLines: 1,
              style: TextStyle(
                fontSize: 24
              ),
              )),
        ],
      )
    );
  }
}
