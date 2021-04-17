import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'info_controller.g.dart';

class InfoController = _InfoController with _$InfoController;


abstract class _InfoController with Store{
  

  @observable
  bool botao = false;

  @action
  void enableBotao() => botao = true;

  @action
  void removeBotao()=> botao = false ;

  @computed
  bool get isButtonFavorite => botao == true;

}
//flutter pub run build_runner build