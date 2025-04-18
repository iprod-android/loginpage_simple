import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage_with_splashscreen/SplashScreen/SplashScreen.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Laasfaf',
      home: Splashscreen(),
    );
  }
}
