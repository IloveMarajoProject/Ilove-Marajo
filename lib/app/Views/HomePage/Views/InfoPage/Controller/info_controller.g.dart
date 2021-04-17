// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InfoController on _InfoController, Store {
  Computed<bool>? _$isButtonFavoriteComputed;

  @override
  bool get isButtonFavorite => (_$isButtonFavoriteComputed ??= Computed<bool>(
          () => super.isButtonFavorite,
          name: '_InfoController.isButtonFavorite'))
      .value;

  final _$botaoAtom = Atom(name: '_InfoController.botao');

  @override
  bool get botao {
    _$botaoAtom.reportRead();
    return super.botao;
  }

  @override
  set botao(bool value) {
    _$botaoAtom.reportWrite(value, super.botao, () {
      super.botao = value;
    });
  }

  final _$_InfoControllerActionController =
      ActionController(name: '_InfoController');

  @override
  void enableBotao() {
    final _$actionInfo = _$_InfoControllerActionController.startAction(
        name: '_InfoController.enableBotao');
    try {
      return super.enableBotao();
    } finally {
      _$_InfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeBotao() {
    final _$actionInfo = _$_InfoControllerActionController.startAction(
        name: '_InfoController.removeBotao');
    try {
      return super.removeBotao();
    } finally {
      _$_InfoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
botao: ${botao},
isButtonFavorite: ${isButtonFavorite}
    ''';
  }
}
