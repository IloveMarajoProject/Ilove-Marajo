// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'initial_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$InitialController on _InitialController, Store {
  final _$dadosAtom = Atom(name: '_InitialController.dados');

  @override
  StreamController<List<MunicipioModel>> get dados {
    _$dadosAtom.reportRead();
    return super.dados;
  }

  @override
  set dados(StreamController<List<MunicipioModel>> value) {
    _$dadosAtom.reportWrite(value, super.dados, () {
      super.dados = value;
    });
  }

  final _$pegarDadosMunicipioAsyncAction =
      AsyncAction('_InitialController.pegarDadosMunicipio');

  @override
  Future pegarDadosMunicipio() {
    return _$pegarDadosMunicipioAsyncAction
        .run(() => super.pegarDadosMunicipio());
  }

  @override
  String toString() {
    return '''
dados: ${dados}
    ''';
  }
}
