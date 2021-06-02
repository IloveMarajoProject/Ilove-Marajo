import 'package:flutter/material.dart';

class DescricaoTabBar extends StatelessWidget {
  final String descricao;
  DescricaoTabBar({required this.descricao});


  @override
  Widget build(BuildContext context) {
    return ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              descricao,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ),
        ],
      );
  }
}