import 'package:bloodnate/screen/home.dart';
import 'package:bloodnate/screen/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class LoginHomeController extends StatelessWidget {
  const LoginHomeController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              return const Home();
            }else{
              return const Login();
            }
          }
      ),
    );
  }
}
