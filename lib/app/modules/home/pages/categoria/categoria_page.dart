import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Shared/enums/categorias_enums.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/controller/categoria_controller.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/widgets/lista_widget.dart';
import 'package:ilovemarajo/app/modules/initial/models/municipio.dart';

class CategoriaPage extends StatefulWidget {
  final MunicipioModel municipioModel;
  final CategoriaEnum categoriaEnum;
  CategoriaPage({
    required this.municipioModel,
    required this.categoriaEnum,
  });
  @override
  _CategoriaPageState createState() => _CategoriaPageState();
}

class _CategoriaPageState extends State<CategoriaPage> {
  CategoriaController _categoriaController = CategoriaController();

  @override
  void initState() {
    super.initState();
    _categoriaController.pegarPraiasDoMunicipios(widget.municipioModel.nome_municipios!);
  }
  String get nameAppBar {
    switch (widget.categoriaEnum) {
      case CategoriaEnum.praias:
        return 'Praias';
      case CategoriaEnum.pousadas:
        return 'Pousadas';
      case CategoriaEnum.restaurantes:
        return 'Restaurantes';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nameAppBar),
        centerTitle: true,
      ),

      body:StreamBuilder<List<PraiaModel>>(
        stream: _categoriaController.dados.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro inesperado :('),
            );
          } else if (!snapshot.hasData) {
            return Center(
              child: Text('Carregando...',style: TextStyle(fontSize: 30,color: Colors.red))
            );
          }
          List<PraiaModel>? dados = snapshot.data;

          if (dados!.isEmpty) {
            return Center(
              child: Text('Sem dados cadastrados :)'),
            );
          }
          return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, index) {
              return ListaWidget(
                praiaModel: dados[index],
              );
            },
          );
        }
      )    
    );
  }
}