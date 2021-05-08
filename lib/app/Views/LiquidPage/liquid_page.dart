import 'dart:math';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/Model/data.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/Widgets/container_liquid.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/Widgets/container_liquid_final.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class LiquidPage extends StatefulWidget {
  @override
  _LiquidPage createState() => _LiquidPage();
}

class _LiquidPage extends State<LiquidPage> {
  int indexTamanho = 0;
  LiquidController? liquidController;
  UpdateType? updateType;

  @override
  void initState() {
    liquidController = LiquidController();
    super.initState();
  }

   List<ItemData> data = [
    ItemData(Colors.blue, "image/ilha2.png", "Olá", "Bem vindo ao ", "Ilove Marajó"),
    ItemData(Colors.purple, "image/ilha.png", "Encontre os melhores", "Pontos turisticos", "do Marajó aqui"),
    ItemData(Colors.cyan, "image/fundos/bufalo.png", "Liked?", "Fork!", "Give Star!"),
  ];
  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(
      max(
        0.0,
        1.0 - ((indexTamanho) - index).abs(),
      ),
    );
    double zoom = 1.0 + (2.0 - 1.0) * selectedness;
    return new Container(
      width: 25.0,
      child: new Center(
        child: new Material(
          color: Colors.white,
          type: MaterialType.circle,
          child: new Container(
            width: 8.0 * zoom,
            height: 8.0 * zoom,
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          body:Stack(
              children: [
                LiquidSwipe.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index){
                    if(index == 2){
                      return  ContainerLiquidFinal(data[2]);
                    }
                    return ContainerLiquid(data[index]);
                  },
                  liquidController: liquidController,
                  enableLoop: false,
                  slideIconWidget: Icon(Icons.arrow_back_ios_rounded),
                  positionSlideIcon: 0.8,
                  onPageChangeCallback: pageChangeCallback,
                  waveType: WaveType.liquidReveal,
                  ignoreUserGestureWhileAnimating: true,
                ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Expanded(child: SizedBox()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List<Widget>.generate(3,_buildDot),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: () {
                    liquidController?.animateToPage(
                        page: data.length - 1, duration: 700);
                  },
                  child: Text("Pular para o final",style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextButton(
                  onPressed: () {
                    liquidController?.animateToPage(
                        page:
                            liquidController!.currentPage + 1 > data.length - 1
                                ? 0
                                : liquidController!.currentPage + 1);
                  },
                  child: Text("Avançar",style: TextStyle(color: Colors.black)),
                ),
              ),
            )
              ],
            ),
          ),
    );
  }
  pageChangeCallback(int lpage) {
    setState(() {
      indexTamanho = lpage;
    });
  }
}