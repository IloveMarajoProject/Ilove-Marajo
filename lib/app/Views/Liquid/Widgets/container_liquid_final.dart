import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilovemarajo/app/Shared/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Shared/Controller/SharedPreference/shared_preference.dart';
import 'package:ilovemarajo/app/Shared/Widgets/showDialog.dart';
import 'package:ilovemarajo/app/Views/Initial/initital_page.dart';
import 'package:ilovemarajo/app/Views/Liquid/Model/data.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContainerLiquidFinal extends StatefulWidget {
  final ItemData data;
  ContainerLiquidFinal(this.data);
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );

  @override
  _ContainerLiquidFinalState createState() => _ContainerLiquidFinalState();
}

class _ContainerLiquidFinalState extends State<ContainerLiquidFinal> {
  GoogleLoginController _liquidController = GoogleLoginController();
  SharedPreferenceController _sharedPreferenceController = SharedPreferenceController();

  @override
  Widget build(BuildContext context) {
    const bool darkMode = false;
    return Observer(
      builder: (_) {
        return Container(
          color: widget.data.color,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                widget.data.image,
                fit: BoxFit.cover,
                height: 200,
              ),
              Text('Para começar',style: ContainerLiquidFinal.style,),
              Text('faça login com uma das plataformas disponiveis', textAlign: TextAlign.center,style: ContainerLiquidFinal.style,),
              SizedBox(height: 20,),
              GoogleAuthButton(
                text: 'Login com google',
                onPressed: () {
                  _liquidController.getUser(context).then((value) {
                    _sharedPreferenceController.loginAuth();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_)=>InitialPage())
                    );
                  }).catchError((e){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Não foi possivel fazer o login. Tente novamente"),
                        backgroundColor: Colors.red,
                      )
                    );
                    print(e);
                  });
                },
                darkMode: darkMode,
                isLoading: _liquidController.loading,
              ),
              SizedBox(height: 20,),
              AppleAuthButton(
                text: 'Login com a Apple',
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context){
                      return ShowDialogGlobal(
                        titulo: 'Aviso:',
                        texto: 'Botão disponível apenas para dispositivos IOS',
                        botaoAction: Navigator.of(context).pop,
                        nomeBotao: 'Continuar',
                      );
                    }
                  );
                },
                darkMode: darkMode,
                isLoading: false,
              ),
            ],
          ),
        );
      }
    );
  }
}