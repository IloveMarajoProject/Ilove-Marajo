import 'package:flutter/material.dart';

class FotosTaoBar extends StatelessWidget {
  const FotosTaoBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return Container(
        child: Center(
          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      );
  }
}