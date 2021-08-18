import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';

class DetalhesPage extends StatefulWidget {
  final PraiaModel? praiaModel;
  final ImageProvider<Object> imageProvider;
  DetalhesPage({required this.praiaModel, required this.imageProvider});
  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> with SingleTickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
    );
  }

}