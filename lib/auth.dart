import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth{
  static final user = FirebaseAuth.instance.currentUser;
  static signInWithEmailPassword(BuildContext context,email,password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email, password: password)
        .then(
            (value){
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
            content: Text("Signed In"),
            backgroundColor: Colors.green,
          ));
          Navigator.pushNamed(context, '/home');
        }).onError((error, stackTrace){
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text((error as FirebaseAuthException).code),backgroundColor: Colors.red,)
          );
    });
  }
  static createAccountWithEmailPassword(BuildContext context,String name,String email,String password) async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value)async{
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created successfully"),backgroundColor: Colors.green,)
          );
      await value.user?.updateDisplayName(name);
      value.user?.sendEmailVerification();
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((error as FirebaseAuthException).code),backgroundColor: Colors.red,)
      );
    });
  }
  static signOut(BuildContext context) async {
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (context)=> AlertDialog(
          title: const Text("Do you want to sign out of the app"),
          actions: [
            TextButton(onPressed: () async {
              await FirebaseAuth.instance.signOut().then((value) => {
                Navigator.popUntil(context,ModalRoute.withName('/')),
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Signed out successfully"),
                    )
                )
              });
            }, child: const Text("Yes")),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("No")),
          ],
        )
    );
  }
}