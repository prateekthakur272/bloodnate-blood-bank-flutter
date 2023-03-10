import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/ic_login.png',height: 160,width: 160),
              const Padding(padding: EdgeInsets.only(top: 24)),
              const Text(
                "Welcome to Bloodnate, Login to continue",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                ),
                textAlign: TextAlign.center,
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              const TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  label: Text("Phone number"),
                  filled: true,
                  fillColor: Color(0xf1f1f1f1),
                ),
                keyboardType: TextInputType.phone,
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, '/home');
                },
                child: Container(
                  padding: const EdgeInsets.all(24),
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(16))
                  ),
                  child: const Center(
                    child: Text('Get OTP',style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        )
      )
    );
  }
}