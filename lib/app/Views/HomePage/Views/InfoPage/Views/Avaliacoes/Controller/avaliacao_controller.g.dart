// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliacao_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvaliacaoController on _AvaliacaoController, Store {
  Computed<bool>? _$isButtonActivateComputed;

  @override
  bool get isButtonActivate => (_$isButtonActivateComputed ??= Computed<bool>(
          () => super.isButtonActivate,
          name: '_AvaliacaoController.isButtonActivate'))
      .value;

  final _$pesquisaAtom = Atom(name: '_AvaliacaoController.pesquisa');

  @override
  String get pesquisa {
    _$pesquisaAtom.reportRead();
    return super.pesquisa;
  }

  @override
  set pesquisa(String value) {
    _$pesquisaAtom.reportWrite(value, super.pesquisa, () {
      super.pesquisa = value;
    });
  }

  final _$editingControllerAtom =
      Atom(name: '_AvaliacaoController.editingController');

  @override
  TextEditingController get editingController {
    _$editingControllerAtom.reportRead();
    return super.editingController;
  }

  @override
  set editingController(TextEditingController value) {
    _$editingControllerAtom.reportWrite(value, super.editingController, () {
      super.editingController = value;
    });
  }

  final _$validacaoAtom = Atom(name: '_AvaliacaoController.validacao');

  @override
  GlobalKey<FormState> get validacao {
    _$validacaoAtom.reportRead();
    return super.validacao;
  }

  @override
  set validacao(GlobalKey<FormState> value) {
    _$validacaoAtom.reportWrite(value, super.validacao, () {
      super.validacao = value;
    });
  }

  final _$_AvaliacaoControllerActionController =
      ActionController(name: '_AvaliacaoController');

  @override
  void setPesquisa(String value) {
    final _$actionInfo = _$_AvaliacaoControllerActionController.startAction(
        name: '_AvaliacaoController.setPesquisa');
    try {
      return super.setPesquisa(value);
    } finally {
      _$_AvaliacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removePesquisa() {
    final _$actionInfo = _$_AvaliacaoControllerActionController.startAction(
        name: '_AvaliacaoController.removePesquisa');
    try {
      return super.removePesquisa();
    } finally {
      _$_AvaliacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pesquisa: ${pesquisa},
editingController: ${editingController},
validacao: ${validacao},
isButtonActivate: ${isButtonActivate}
    ''';
  }
}
