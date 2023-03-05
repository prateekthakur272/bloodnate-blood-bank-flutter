import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64,left: 32,right: 32),
      color: Colors.blue,
      child: Column(
        children: [
          Container(height: 200,width: 200,alignment: Alignment.topCenter,color: Colors.amber,child: Image.asset("name"),)
        ],
      ),
    );
  }
}