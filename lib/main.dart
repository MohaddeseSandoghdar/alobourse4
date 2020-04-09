import 'package:alobourse/alobourse_home.dart';
import 'package:alobourse/splash_screen.dart';
import 'package:flutter/material.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'الو بورس',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'IranSans' ,
        primaryColor: Color(0xff08a6b5),
        accentColor: Color(0xff08a6b5),
        cursorColor: Colors.white,
//        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => new Directionality(textDirection: TextDirection.rtl, child: SplashScreen(),),
//        '/': (context) => new Directionality(textDirection: TextDirection.rtl, child: AloBourseHome(),),
      },
    );
  }

}
