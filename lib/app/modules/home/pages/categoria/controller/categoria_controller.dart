import 'dart:async';

import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/service/categoria_service.dart';
import 'package:mobx/mobx.dart';

part 'categoria_controller.g.dart';
class CategoriaController = _CategoriaController with _$CategoriaController;

abstract class _CategoriaController with Store {
  
  CategoriaService service = CategoriaService();

  @observable
  StreamController<List<PraiaModel>> dados = StreamController<List<PraiaModel>>();

  @action
  pegarPraiasDoMunicipios(String municipio) async {
    List<PraiaModel> dadosPraiasMuncipio = await service.pegarPraiasDoMunicipios(municipio);
    dados.add(dadosPraiasMuncipio);
  }
}