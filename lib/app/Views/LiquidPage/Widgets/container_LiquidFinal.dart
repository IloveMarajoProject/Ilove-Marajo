import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/Model/data.dart';
import 'package:auth_buttons/auth_buttons.dart';

class ContainerLiquidFinal extends StatelessWidget {
  final ItemData data;
  ContainerLiquidFinal(this.data);
  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    color: Colors.black,
    fontWeight: FontWeight.w600,
  );
  @override
  Widget build(BuildContext context) {
    const bool darkMode = false;
    return Container(
      color: data.color,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            data.image,
            fit: BoxFit.cover,
            height: 200,
          ),
          Text('Para começar',style: style,),
          Text('Faça login com uma das plataformas disponiveis', textAlign: TextAlign.center,style: style,),
          SizedBox(height: 20,),
          GoogleAuthButton(
            onPressed: () {},
            darkMode: darkMode,
            isLoading: false,
          ),
          SizedBox(height: 20,),
          AppleAuthButton(
            onPressed: () {},
            darkMode: darkMode,
            isLoading: false,
          ),
        ],
      ),
    );
  }
}