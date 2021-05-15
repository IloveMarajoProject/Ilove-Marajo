import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';

class TabBarData {
  final PraiaModel? praiaModel;

  TabBarData(
    {
      this.praiaModel
    }
  );

  List<Widget> listTabBar(){
    return [
      Tab(text: 'Descrição'),
      Tab(text: 'Avaliações'),
      Tab(text: 'Fotos'),
    ];
  }
  
  List<Widget> listaConteudoTabBar(){
    return [
      ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              praiaModel!.descricao.toString(),
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ),
        ],
      ),
      Container(
        child: Center(
          child: Text('Display Tab 2', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
      Container(
        child: Center(
          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
    ];
  }
}