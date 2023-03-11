import 'package:bloodnate/widget/drawer/drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bloodnate'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 480
            ),
            child: Column(
              children: [
                Text(FirebaseAuth.instance.currentUser?.email??"No email"),
                Text(FirebaseAuth.instance.currentUser?.displayName??"No Name"),
                Text(FirebaseAuth.instance.currentUser?.photoURL??"No url"),
                Text(FirebaseAuth.instance.currentUser.toString()),
              ],
            ),
          ),
        ),
      ),
      drawer:const DrawerHome()
    );
  }
}