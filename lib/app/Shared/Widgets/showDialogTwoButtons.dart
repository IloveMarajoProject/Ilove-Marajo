import 'package:flutter/material.dart';

class ShowDialogTwoButtonGlobal extends StatelessWidget {
  final String? titulo;
  final String? texto;
  final String? nomeBotao;
  final void Function(BuildContext context) botaoAction;

  ShowDialogTwoButtonGlobal({required this.titulo, required this.botaoAction,this.nomeBotao,this.texto});
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text(titulo.toString()),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              texto != null ? Text(texto.toString()) : Text(''),
            ],
          ),
        ),
        actions: <Widget> [
          TextButton(
            child: Text('Cancelar',style: TextStyle(color: Colors.red),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: nomeBotao != null? Text(nomeBotao.toString()) : Text('Aceitar'),
            onPressed: () {
              this.botaoAction(context);
            },
          )
        ]
    );
  }
}