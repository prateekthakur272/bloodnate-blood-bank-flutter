import 'package:flutter/material.dart';
class CreateAccountProvider extends StatefulWidget {
  const CreateAccountProvider({Key? key}) : super(key: key);

  @override
  State<CreateAccountProvider> createState() => _CreateAccountProviderState();
}

class _CreateAccountProviderState extends State<CreateAccountProvider> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Account"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: const [

              ],
            ),
          )
        ),
      ),
    );
  }
}
