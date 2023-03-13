import 'package:bloodnate/auth.dart';
import 'package:bloodnate/database/repository.dart';
import 'package:bloodnate/widget/button.dart';
import 'package:bloodnate/widget/text_input_field.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final name = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final pinCode = TextEditingController();
  final user = Auth.user;

  @override
  Widget build(BuildContext context) {
    name.text = user?.displayName??"";
    email.text = user?.email??"";
    final repository = Repository(context);
    repository.userCollection.doc(Auth.user?.uid).get().then((value){
      phone.text = value.data()!['phone']??"";
      address.text = value.data()!['address']??"";
      pinCode.text = value.data()!['pin_code']??"";
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Details"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              Image.asset(
                'assets/img_edit_profile.png',
                width: 120,
                height: 120,
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              TextInputField("Full name", name, TextInputType.name),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              TextInputField("Email", email, TextInputType.emailAddress),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              TextInputField("Phone number", phone, TextInputType.phone),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              TextInputField("Full address", address, TextInputType.text),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
              TextInputField("Pin code", pinCode, TextInputType.number),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              const Divider(thickness: 1,color: Colors.grey,),
              const Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              Button("Save Changes", (){
                repository.updateUser({
                  "name":name.text.trim(),
                  "email":email.text.trim(),
                  "phone":phone.text.trim(),
                  "address":address.text.trim(),
                  "pin_code":pinCode.text.trim(),
                });
              }),
              const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
