import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/LoginPage/login_page.dart';
import 'package:ilovemarajo/app/app_widget.dart';
import 'package:responsive_framework/responsive_framework.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Myapp());
}


