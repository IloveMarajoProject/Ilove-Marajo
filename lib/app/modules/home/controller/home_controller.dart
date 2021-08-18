import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/service/home_service.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;


abstract class _HomeController with Store{
  

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

//flutter pub run build_runner build --delete-conflicting-outputs