// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pages_icon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PagesIconController on _PagesIconController, Store {
  final _$dadosAtom = Atom(name: '_PagesIconController.dados');

  @override
  StreamController<List<PraiaModel>> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(StreamController<List<PraiaModel>> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$pegarPraiasDoMunicipiosAsyncAction =
      AsyncAction('_PagesIconController.pegarPraiasDoMunicipios');

  @override
  Future pegarPraiasDoMunicipios(String municipio) {
    return _$pegarPraiasDoMunicipiosAsyncAction
        .run(() => super.pegarPraiasDoMunicipios(municipio));
  }

  @override
  String toString() {
    return '''
dados: ${dados}
    ''';
  }
}
