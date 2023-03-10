import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const PasswordInputField(this.label,this.controller,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
          maxWidth: 480
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(16))
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          label: Text(label),
          filled: true,
          fillColor: const Color(0xf1f1f1f1),
        ),
        keyboardType: TextInputType.text,
        obscureText: true,
      ),
    );
  }
}
