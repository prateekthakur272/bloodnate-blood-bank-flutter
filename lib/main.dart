import 'package:bloodnate/screen/create_account.dart';
import 'package:bloodnate/screen/edit_profile.dart';
import 'package:bloodnate/screen/forgot_password.dart';
import 'package:bloodnate/screen/profile.dart';
import 'package:bloodnate/screen_controller/login_home_controller.dart';
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
        '/':(context) => const LoginHomeController(),
        '/create_account':(context) => const CreateAccount(),
        '/home/profile':(context)=> const Profile(),
        '/home/profile/edit_profile':(context)=> const EditProfile(),
        '/forgot_password':(context)=> const ForgotPassword()
      },
      initialRoute: '/',
    );
  }
}