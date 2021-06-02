import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Model/avaliacao_model.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Service/info_page_service.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Views/Avaliacoes/service/avaliacao_service.dart';
import 'package:mobx/mobx.dart';
part 'info_controller.g.dart';

class InfoController = _InfoController with _$InfoController;


abstract class _InfoController with Store{
  
  InfoPageService infoPageService = InfoPageService();  
  
  @observable
  StreamController<List<AvaliacaoModel>> dados = StreamController<List<AvaliacaoModel>>();

  @observable
  bool botao = false;

  @action
  void enableBotao() => botao = true;

  @action
  void removeBotao()=> botao = false ;

  @action
  getAvaliacoes(int idLocal) async {
   List<AvaliacaoModel> response = await infoPageService.getAvaliacoes(idLocal: idLocal);
   dados.add(response);
  }

  @computed
  bool get isButtonFavorite => botao == true;

}
//flutter pub run build_runner build