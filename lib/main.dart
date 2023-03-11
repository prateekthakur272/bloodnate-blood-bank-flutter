import 'package:bloodnate/screen/create_account.dart';
import 'package:bloodnate/screen/home.dart';
import 'package:bloodnate/screen/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.redAccent[100],
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) => const Login(),
        '/home':(context) => const Home(),
        '/create_account':(context) => CreateAccount()
      },
      initialRoute: '/',
    );
  }
}