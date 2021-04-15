import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'avaliacao_controller.g.dart';

class AvaliacaoController = _AvaliacaoController with _$AvaliacaoController;

abstract class _AvaliacaoController with Store {
  
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

  @computed
  bool get isButtonActivate => pesquisa.length > 3;
}

//flutter pub run build_runner build