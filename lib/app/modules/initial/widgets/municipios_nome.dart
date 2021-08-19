import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/home_page.dart';
import 'package:ilovemarajo/app/modules/initial/models/municipio.dart';

class NomesMunicipios extends StatelessWidget {
  final MunicipioModel dados;
  NomesMunicipios(this.dados);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        child: Center(
          child: AutoSizeText(
              dados.nome_municipios.toString(),
              style: TextStyle(
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.green
              )
          )
        ),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> HomePage(dados))
          );
        },
      ),
    );
  }
}