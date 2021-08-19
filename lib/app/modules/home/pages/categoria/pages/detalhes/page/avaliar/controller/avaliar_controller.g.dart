// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avaliar_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AvaliarController on _AvaliarController, Store {
  Computed<bool>? _$isButtonActivateComputed;

  @override
  bool get isButtonActivate => (_$isButtonActivateComputed ??= Computed<bool>(
          () => super.isButtonActivate,
          name: '_AvaliarController.isButtonActivate'))
      .value;

  final _$pesquisaAtom = Atom(name: '_AvaliarController.pesquisa');

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
      Atom(name: '_AvaliarController.editingController');

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

  final _$estrelasAtom = Atom(name: '_AvaliarController.estrelas');

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

  final _$validacaoAtom = Atom(name: '_AvaliarController.validacao');

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
      AsyncAction('_AvaliarController.enviarAvaliacao');

  @override
  Future enviarAvaliacao(
      {double? nota, String? nome, String? comentario, int? idLocal}) {
    return _$enviarAvaliacaoAsyncAction.run(() => super.enviarAvaliacao(
        nota: nota, nome: nome, comentario: comentario, idLocal: idLocal));
  }

  final _$_AvaliarControllerActionController =
      ActionController(name: '_AvaliarController');

  @override
  void setEstrelas(double star) {
    final _$actionInfo = _$_AvaliarControllerActionController.startAction(
        name: '_AvaliarController.setEstrelas');
    try {
      return super.setEstrelas(star);
    } finally {
      _$_AvaliarControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAvaliacao(String value) {
    final _$actionInfo = _$_AvaliarControllerActionController.startAction(
        name: '_AvaliarController.setAvaliacao');
    try {
      return super.setAvaliacao(value);
    } finally {
      _$_AvaliarControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAvaliacao() {
    final _$actionInfo = _$_AvaliarControllerActionController.startAction(
        name: '_AvaliarController.removeAvaliacao');
    try {
      return super.removeAvaliacao();
    } finally {
      _$_AvaliarControllerActionController.endAction(_$actionInfo);
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
