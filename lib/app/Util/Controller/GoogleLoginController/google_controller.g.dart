// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleLoginController on _GoogleLoginController, Store {
  final _$googleSignInAtom = Atom(name: '_GoogleLoginController.googleSignIn');

  @override
  GoogleSignIn get googleSignIn {
    _$googleSignInAtom.reportRead();
    return super.googleSignIn;
  }

  @override
  set googleSignIn(GoogleSignIn value) {
    _$googleSignInAtom.reportWrite(value, super.googleSignIn, () {
      super.googleSignIn = value;
    });
  }

  final _$currentUserAtom = Atom(name: '_GoogleLoginController.currentUser');

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  final _$loadingAtom = Atom(name: '_GoogleLoginController.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$getUserAsyncAction = AsyncAction('_GoogleLoginController.getUser');

  @override
  Future<User?> getUser(BuildContext context) {
    return _$getUserAsyncAction.run(() => super.getUser(context));
  }

  final _$_GoogleLoginControllerActionController =
      ActionController(name: '_GoogleLoginController');

  @override
  void setUser(User? user) {
    final _$actionInfo = _$_GoogleLoginControllerActionController.startAction(
        name: '_GoogleLoginController.setUser');
    try {
      return super.setUser(user);
    } finally {
      _$_GoogleLoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic logoutGoogle() {
    final _$actionInfo = _$_GoogleLoginControllerActionController.startAction(
        name: '_GoogleLoginController.logoutGoogle');
    try {
      return super.logoutGoogle();
    } finally {
      _$_GoogleLoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
googleSignIn: ${googleSignIn},
currentUser: ${currentUser},
loading: ${loading}
    ''';
  }
}
