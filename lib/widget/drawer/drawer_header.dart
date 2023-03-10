import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class DrawerHomeHeader extends StatelessWidget {
  const DrawerHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration:BoxDecoration(
            color: Colors.red[200]
        ),
        child: Text(FirebaseAuth.instance.currentUser?.email??"")
    );
  }
}
