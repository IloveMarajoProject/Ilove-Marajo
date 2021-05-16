import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  final String text;
  final Color colorBar;

  AppBarWidget({required this.colorBar, required this.text});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(text),
      centerTitle: true,
      backgroundColor: colorBar,
      actions: [
        IconButton(
          icon: Icon(Icons.info),
          onPressed: (){}
        )
      ],
    );
  }
}