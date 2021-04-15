import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/LiquidPage/LiquidPage.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'Views/LoginPage/login_page.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context,widget)=>ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context,widget!),
        minWidth: 450,
        defaultScale: true,
        breakpoints: [
            ResponsiveBreakpoint.resize(450, name: MOBILE),
            ResponsiveBreakpoint.resize(800, name: TABLET),
        ]
        ),
      home: LiquidPage(),
    );
  }
}