import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';

class DescricaoTab extends StatelessWidget {
  final PraiaModel model;
  DescricaoTab(this.model);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          Text(model.descricao!,style: TextStyle(fontSize: 18))
        ],
      ),
    );
  }
}