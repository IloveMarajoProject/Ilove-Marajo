import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ilovemarajo/app/Util/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Util/Controller/SharedPreference/shared_preference.dart';

class DrawerPage extends StatefulWidget {
  final User? currentUser;
  DrawerPage(this.currentUser);
  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  SharedPreferenceController _preferenceController = SharedPreferenceController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(52),
              child: Image.network('${widget.currentUser!.photoURL.toString()}',
                fit: BoxFit.cover,
                height: 100,
                width: 100,
                errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace){
                  return CircularProgressIndicator();
                },
            ),
          ),
          SizedBox(height: 20),
          Text(
            widget.currentUser!.displayName.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Row(
                children: [
                  Icon(Icons.beach_access),
                  Text('Escolher outros municipios')
                ],
              ),
              onPressed: (){
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              child: Row(
                children: [
                  Icon(Icons.logout),
                  Text('Sair da conta')
                ],
              ),
              onPressed: (){
                Navigator.of(context).popAndPushNamed('/tela1').then((value) {
                  _preferenceController.loginClose();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}