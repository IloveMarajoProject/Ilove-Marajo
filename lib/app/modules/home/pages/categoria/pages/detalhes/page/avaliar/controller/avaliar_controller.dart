import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/pages/detalhes/page/avaliar/service/avaliar_service.dart';
import 'package:mobx/mobx.dart';
part 'avaliar_controller.g.dart';

class AvaliarController = _AvaliarController with _$AvaliarController;

abstract class _AvaliarController with Store {
  
  AvaliarService avaliacaoService = AvaliarService();

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

  @action
  enviarAvaliacao({double? nota,String? nome, String? comentario, int? idLocal}) async {
    await avaliacaoService.enviarAvaliacao(
      comentario: comentario,
      idLocal: idLocal,
      nome: nome,
      nota: nota
    );
  }

  @computed
  bool get isButtonActivate => pesquisa.length > 3 && estrelas > 0.0;
}