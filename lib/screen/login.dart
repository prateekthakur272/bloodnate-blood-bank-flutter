import 'package:bloodnate/auth.dart';
import 'package:bloodnate/widget/button_with_start_icon.dart';
import 'package:bloodnate/widget/text_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widget/button.dart';
import '../widget/password_input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 480),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/img_login.png',
                        height: 120, width: 120),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    const Text(
                      "Welcome to Bloodnate, Login to continue",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    TextInputField("Email", email, TextInputType.emailAddress),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    PasswordInputField("Password", password),
                    const Padding(padding: EdgeInsets.only(top: 8)),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        child: const Text(
                          "Forgot password",
                          style: TextStyle(color: Colors.grey),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                      ),
                    ),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    Button("Sign In", () {
                      Auth.signInWithEmailPassword(context, email.text, password.text);
                    }),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    GestureDetector(
                      child: const Text(
                        "Create account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/create_account');
                      },
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    const Divider(
                      thickness: 2,
                    ),
                    const Padding(padding: EdgeInsets.only(top: 12)),
                    ButtonWithStartIcon(
                        "Sign in with google", FontAwesomeIcons.google, () {
                          Navigator.pushNamed(context, '/create_account_with_provider');
                    }),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                    ButtonWithStartIcon(
                        "Sign in with Apple", FontAwesomeIcons.apple, () {}),
                    const Padding(padding: EdgeInsets.only(top: 24)),
                  ],
                ),
              ),
            )));
  }
}
