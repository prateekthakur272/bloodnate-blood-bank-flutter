import 'package:bloodnate/widget/profile_card.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email = TextEditingController();
  bool enabled = true;
  
  @override
  Widget build(BuildContext context) {
    email.text = Auth.user?.email??"";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(Auth.user?.displayName??"Profile"),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.edit))
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 480
            ),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                ProfileCard(),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                //Button("Edit", (){})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
