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
  double estrelas = 0.0;

  @action
  void setEstrelas(double star) => estrelas = star;

  @observable
  GlobalKey<FormState> validacao = GlobalKey<FormState>();

  @action
  void setAvaliacao(String value) => pesquisa = value;

  @action
  void removeAvaliacao()=> pesquisa = '';

  @computed
  bool get isButtonActivate => pesquisa.length > 3 && estrelas > 0.0;
}

//flutter pub run build_runner build