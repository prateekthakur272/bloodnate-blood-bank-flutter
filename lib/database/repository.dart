import 'package:bloodnate/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Repository{
  static final instance = FirebaseFirestore.instance;
  static final userCollection = FirebaseFirestore.instance.collection('users');

  static Future<void> addUser (Map<String,dynamic> data) async {
    await userCollection.doc(Auth.user?.uid).set(data);
  }

  static Future<void> updateUser(Map<String,dynamic> data) async {
    return await userCollection.doc(Auth.user?.uid).update(data);
  }

  static Future<DocumentSnapshot<Map<String, dynamic>>> _getUserSnapshot(){
    return userCollection.doc(Auth.user?.uid).get();
  }

  static Future<Map<String, dynamic>> getUser() async {
    DocumentSnapshot<Map<String,dynamic>> snapshot = await _getUserSnapshot();
    return{
      'name':snapshot.data()?['name'],
      'email':snapshot.data()?['email'],
      'address':snapshot.data()?['address'],
      'phone':snapshot.data()?['phone'],
      'pin_code':snapshot.data()?['pin_code'],
    };
  }
}