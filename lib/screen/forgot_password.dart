import 'package:bloodnate/auth.dart';
import 'package:bloodnate/widget/button.dart';
import 'package:bloodnate/widget/text_input_field.dart';
import 'package:flutter/material.dart';
class ForgotPassword extends StatelessWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Reset Password"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/img_password.png',height: 120,width: 120,),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                const Text("You will receive an email with password reset link, please enter your email address",textAlign:TextAlign.center),
                const Padding(padding: EdgeInsets.symmetric(vertical: 12)),
                TextInputField("Email address", email, TextInputType.emailAddress),
                const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Button("Reset password", (){
                  Auth.resetPasswordWithEmail(context, email.text.trim());
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
