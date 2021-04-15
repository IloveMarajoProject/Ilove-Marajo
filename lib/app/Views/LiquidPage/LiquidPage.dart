import 'dart:math';
import 'package:flutter/material.dart';
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

   final pages = [
    Container(color: Colors.red,),
    Container(color: Colors.blue,),
    Container(color: Colors.yellow,),
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
                LiquidSwipe(
                  initialPage: 0,
                  liquidController: liquidController,
                  enableLoop: false,
                  slideIconWidget: Icon(Icons.arrow_back_ios_rounded),
                  pages: pages,
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
                child: ElevatedButton(
                  onPressed: () {
                    liquidController?.animateToPage(
                        page: pages.length - 1, duration: 700);
                  },
                  child: Text("Pular para o final"),
                  //color: Colors.white.withOpacity(0.01),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: ElevatedButton(
                  onPressed: () {
                    liquidController?.animateToPage(
                        page:
                            liquidController!.currentPage + 1 > pages.length - 1
                                ? 0
                                : liquidController!.currentPage + 1);
                  },
                  child: Text("Avançar"),
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