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

  final _$estrelasAtom = Atom(name: '_AvaliacaoController.estrelas');

  @override
  double get estrelas {
    _$estrelasAtom.reportRead();
    return super.estrelas;
  }

  @override
  set estrelas(double value) {
    _$estrelasAtom.reportWrite(value, super.estrelas, () {
      super.estrelas = value;
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

  final _$enviarAvaliacaoAsyncAction =
      AsyncAction('_AvaliacaoController.enviarAvaliacao');

  @override
  Future enviarAvaliacao({double? nota, String? comentario, int? idLocal}) {
    return _$enviarAvaliacaoAsyncAction.run(() => super
        .enviarAvaliacao(nota: nota, comentario: comentario, idLocal: idLocal));
  }

  final _$_AvaliacaoControllerActionController =
      ActionController(name: '_AvaliacaoController');

  @override
  void setEstrelas(double star) {
    final _$actionInfo = _$_AvaliacaoControllerActionController.startAction(
        name: '_AvaliacaoController.setEstrelas');
    try {
      return super.setEstrelas(star);
    } finally {
      _$_AvaliacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvaliacao(String value) {
    final _$actionInfo = _$_AvaliacaoControllerActionController.startAction(
        name: '_AvaliacaoController.setAvaliacao');
    try {
      return super.setAvaliacao(value);
    } finally {
      _$_AvaliacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAvaliacao() {
    final _$actionInfo = _$_AvaliacaoControllerActionController.startAction(
        name: '_AvaliacaoController.removeAvaliacao');
    try {
      return super.removeAvaliacao();
    } finally {
      _$_AvaliacaoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pesquisa: ${pesquisa},
editingController: ${editingController},
estrelas: ${estrelas},
validacao: ${validacao},
isButtonActivate: ${isButtonActivate}
    ''';
  }
}
