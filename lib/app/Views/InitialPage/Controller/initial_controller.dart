import 'dart:async';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Views/InitialPage/Models/municipio.dart';
import 'package:ilovemarajo/app/Views/InitialPage/Service/initial_service.dart';
import 'package:mobx/mobx.dart';
part 'initial_controller.g.dart';

class InitialController = _InitialController with _$InitialController;

abstract class _InitialController with Store {
  
  InitialService service = InitialService();

  @observable
  StreamController<List<MunicipioModel>> dados = StreamController<List<MunicipioModel>>();


  @action
  pegarDadosMunicipio() async {
    List<MunicipioModel> dadosMunicipios = await service.pegarMunicipios();
    dados.add(dadosMunicipios);
  }

}
//flutter pub run build_runner build --delete-conflicting-outputs