import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mobx/mobx.dart';
part 'liquid_controller.g.dart';


class LiquidController = _LiquidController with _$LiquidController;

abstract class _LiquidController with Store {

  @observable
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @observable
  User? currentUser; 

  @action
  void setUser(User user)=> currentUser = user;

  @action
  Future<User?> _getUser() async {
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

      return user;
    } catch (error) {
      return null!;
    }
  }
}

//flutter pub run build_runner build