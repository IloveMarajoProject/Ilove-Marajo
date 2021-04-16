import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'google_controller.g.dart';


class GoogleLoginController = _GoogleLoginController with _$GoogleLoginController;

abstract class _GoogleLoginController with Store {

  @observable
  GoogleSignIn googleSignIn = GoogleSignIn();

  @observable
  User? currentUser; 

  @observable
  bool loading = false;

  @action
  void setUser(User? user)=> currentUser = user;

  @action
  logoutGoogle(){
    googleSignIn.signOut();
  }

  @action
  Future<User?> getUser(BuildContext context) async {
    loading = true;
    if (currentUser != null) return currentUser;

    try {
      final GoogleSignInAccount googleSignInAccount = (await googleSignIn
          .signIn())!;
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      var authResult = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User user = authResult.user!;

      loading = false;

      return user;

    } catch (error) {
      loading = false;
      return null!;
    }
  }
}

//flutter pub run build_runner build