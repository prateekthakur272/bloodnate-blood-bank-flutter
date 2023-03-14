import 'package:bloodnate/widget/profile_card.dart';
import 'package:flutter/material.dart';
import '../auth.dart';
import '../widget/button.dart';
class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    email.text = Auth.user?.email??"";
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(Auth.user?.displayName??"Profile"),
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
                Button("Edit Profile", (){
                  Navigator.pushNamed(context, '/home/profile/edit_profile');
                  _showLoader(context);
                }),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static _showLoader(BuildContext context){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
    );
  }
}
