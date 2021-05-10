import 'package:flutter/material.dart';

class ListaWidgetPopular extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        height: 100,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage('image/fundos/login.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          child: Stack(
            children: <Widget>[
              Container(),
              Positioned(
                bottom: 40,
                left: 10,
                child: Text(
                  'Praia Grande',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Positioned(
                left: 10,
                bottom: 10,
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.location_on,
                      color: Color(0xFFf36f7c),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Salvaterra',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
