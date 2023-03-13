import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth{
  static User? get user{
    return FirebaseAuth.instance.currentUser;
  }

  static signInWithEmailPassword(BuildContext context,email,password) async {
    _showLoader(context);
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
        email: email, password: password)
        .then(
            (value){
              Navigator.pop(context);
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(
                content: Text("Signed In"),
                backgroundColor: Colors.green,
              ));
        }).onError((error, stackTrace){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text((error as FirebaseAuthException).code),backgroundColor: Colors.red,)
              );
    });
  }

  static createAccountWithEmailPassword(BuildContext context,String name,String email,String password) async {
    _showLoader(context);
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password)
        .then((value)async{
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Account created successfully, please verify email to sign in"),backgroundColor: Colors.green,)
          );
          await value.user?.updateDisplayName(name).then((v){
            value.user?.updateDisplayName(name);
            value.user?.sendEmailVerification();
            Navigator.pop(context);
          });
    }).onError((error, stackTrace){
      Navigator.pop(context);
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
                Navigator.pop(context),
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Signed out successfully"),
                    )
                ),
                Navigator.popUntil(context,ModalRoute.withName('/'))
              });
            }, child: const Text("Yes")),
            TextButton(onPressed: (){
              Navigator.pop(context);
            }, child: const Text("No")),
          ],
        )
    );
  }

  static resetPasswordWithEmail(BuildContext context,String email){
    _showLoader(context);
    FirebaseAuth.instance.sendPasswordResetEmail(email: email).then((value){
      Navigator.popUntil(context,ModalRoute.withName('/'));
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Password reset link sent to $email"))
      );
    }).onError((error, stackTrace){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text((error as FirebaseAuthException).code),backgroundColor: Colors.red,)
      );
    });
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