import 'package:bloodnate/screen/home.dart';
import 'package:bloodnate/screen/login.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent[100],
        primarySwatch: Colors.brown
      ),
      home: const Login(),
    );
  }
}