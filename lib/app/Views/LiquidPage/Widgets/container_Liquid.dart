import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/Model/data.dart';

class ContainerLiquid extends StatelessWidget {
  final ItemData data;
  ContainerLiquid(this.data);

  static final style = TextStyle(
    fontSize: 30,
    fontFamily: "Billy",
    fontWeight: FontWeight.w600,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      color: data.color,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(
            data.image,
            fit: BoxFit.cover,
            height: 200,
          ),
          Column(
            children: <Widget>[
              Text(
                data.text1,
                style: style,
              ),
              Text(
                data.text2,
                style: style,
              ),
              Text(
                data.text3,
                style: style,
              ),
            ],
          ),
        ],
      ),
    );
  }
}