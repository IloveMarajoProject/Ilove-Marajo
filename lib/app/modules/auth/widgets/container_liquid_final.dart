import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:ilovemarajo/app/Shared/Widgets/showDialog.dart';
import 'package:auth_buttons/auth_buttons.dart';
import 'package:ilovemarajo/app/Shared/controller/google_login/google_controller.dart';
import 'package:ilovemarajo/app/modules/auth/model/data.dart';
import 'package:ilovemarajo/app/modules/initial/initital_page.dart';

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
  GoogleLoginController _googleController = GoogleLoginController();

  login() async {
    try {
      await _googleController.getUser(context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_)=>InitialPage())
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Não foi possivel fazer o login. Tente novamente"),
          backgroundColor: Colors.red,
        )
      );
      print(e);
    }
  }
  
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
                onPressed: () => login(),
                darkMode: darkMode,
                isLoading: _googleController.loading,
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