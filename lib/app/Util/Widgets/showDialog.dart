import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShowDialogGlobal extends StatelessWidget {
  final String? titulo;
  final String? texto;
  final String? nomeBotao;
  final bool? twoButton;
  final void Function(BuildContext context) botaoAction;

  ShowDialogGlobal({required this.titulo, required this.botaoAction,this.nomeBotao,this.texto,required this.twoButton});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: titulo != null ? Text(titulo.toString()) : Text('Adicione um titulo'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              texto != null ? Text(texto.toString()) : Text(''),
            ],
          ),
        ),
        actions: twoButton == true ? <Widget> [
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
        :
        [
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