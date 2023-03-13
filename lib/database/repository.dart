import 'package:bloodnate/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Repository{
  Repository(this.context);
  final BuildContext context;
  final instance = FirebaseFirestore.instance;
  final userCollection = FirebaseFirestore.instance.collection('users');

  void addUser(Map<String,dynamic> data){
    userCollection.doc(Auth.user?.uid).set(data).then((value){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Changes saved"),backgroundColor: Colors.green,)
      );
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Can not save changes please retry"),backgroundColor: Colors.red,)
      );
    });
  }

  void updateUser(Map<String,dynamic> data){
    userCollection.doc(Auth.user?.uid).update(data).then((value){
      Navigator.pop(context);
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Changes saved"),backgroundColor: Colors.green,)
      );
    }).onError((error, stackTrace){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Can not save changes please retry"),backgroundColor: Colors.red,)
      );
    });
  }

}