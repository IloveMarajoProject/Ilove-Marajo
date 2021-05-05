import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Service/home_service.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;


abstract class _HomeController with Store{
  
  HomeService service = HomeService();

  @observable
  StreamController<List<PraiaModel>> dados = StreamController<List<PraiaModel>>();

  @observable
  String pesquisa = '';

  @observable
  TextEditingController editingController = TextEditingController();

  @observable
  GlobalKey<FormState> validacao = GlobalKey<FormState>();

  @action
  void setPesquisa(String value) => pesquisa = value;

  @action
  void removePesquisa()=> pesquisa = '';

  @action
  pegarPraisDoMunicipios(String municipio) async {
    List<PraiaModel> dadosPraiasMuncipio = await service.pegarPraisDoMunicipios(municipio);
    dados.add(dadosPraiasMuncipio);
  }

  @computed
  bool get isButtonActivate => pesquisa.length > 3;

}

//flutter pub run build_runner build --delete-conflicting-outputs