import 'package:flutter/material.dart';

class IconWidgetPontos extends StatelessWidget {
  final String nome;
  final IconData icone;
  final Color? iconeColor;
  final Color? containerColor;
  final VoidCallback? ontap;

  IconWidgetPontos(
    {
      required this.nome, 
      required this.icone, 
      required this.containerColor, 
      required this.iconeColor,
      this.ontap
      }
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=> this.ontap!(),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(10)
            ),
            child: Center(
              child: Icon(
                icone,
                size: 50,
                color: iconeColor,
                ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(nome),
          )
        ],
      ),
    );
  }
}