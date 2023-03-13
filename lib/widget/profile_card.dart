import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key}) : super(key: key);
  final User user = Auth.user!;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 480
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/img_donate.png'),
            Text(
              user.displayName??"No Name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 1,color: Colors.grey,),
            Text(user.email!),
            Text(user.emailVerified?"Verified":"Not verified"),
            const Text("Blood group"),
            const Text("Address"),
          ],
        ),
      ),
    );
  }
}
