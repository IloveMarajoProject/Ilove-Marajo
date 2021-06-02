import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Views/Avaliacoes/service/avaliacao_service.dart';
import 'package:mobx/mobx.dart';
part 'avaliacao_controller.g.dart';

class AvaliacaoController = _AvaliacaoController with _$AvaliacaoController;

abstract class _AvaliacaoController with Store {
  
  AvaliacaoService avaliacaoService = AvaliacaoService();

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

//flutter pub run build_runner build