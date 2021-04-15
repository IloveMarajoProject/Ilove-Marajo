import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;


abstract class _HomeController with Store{
  
  _HomeController(){
    autorun((_){
      print(pesquisa);
      print(isButtonActivate);
    });
  }

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