import 'package:bloodnate/widget/button.dart';
import 'package:bloodnate/widget/password_input_field.dart';
import 'package:bloodnate/widget/text_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class CreateAccount extends StatefulWidget {
  const CreateAccount({Key? key}) : super(key: key);

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  final TextEditingController email =TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 480
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Image.asset('assets/img_create_account.png',height: 120,width: 120),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                const Text(
                    "Please enter following details to create an account",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                TextInputField("Name",TextEditingController(),TextInputType.name),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                TextInputField("Email",email,TextInputType.emailAddress),
                const Padding(padding: EdgeInsets.symmetric(vertical:12)),
                const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Please enter a strong password",)
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                PasswordInputField("Password", password),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                PasswordInputField("Confirm password", confirmPassword),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                const Divider(thickness: 2,),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                Button("Create Account",() async {
                  if(password.text==confirmPassword.text){
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email.text, password: password.text)
                        .then((value){
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Account created successfully"),backgroundColor: Colors.green,)
                      );
                    }).onError((error, stackTrace){
                      print((error as FirebaseAuthException).code);
                      switch((error as FirebaseAuthException).code){
                        case 'weak-password':{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Weak Password"),backgroundColor: Colors.red,)
                          );
                          break;
                        }
                        case 'missing-email':
                        case 'invalid-email':
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("Please enter a valid email address"),backgroundColor: Colors.red,)
                            );
                            break;
                          }
                        case 'email-already-in-use':{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Email already in use"),backgroundColor: Colors.red,)
                          );
                          break;
                        }
                        case 'network-request-failed':{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("No internet connection"),backgroundColor: Colors.red,)
                          );
                          break;
                        }
                      }
                    });
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Confirm password did not matched"),backgroundColor: Colors.red,)
                    );
                  }
                }),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                GestureDetector(
                  child: const Text(
                    "Already have an account? Sign In",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
