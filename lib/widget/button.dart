import 'package:flutter/material.dart';
class Button extends StatelessWidget {
  final String text;
  final Function onClick;
  const Button(this.text,this.onClick,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Material(
        elevation: 8,
        color: Colors.transparent,
        child: Container(
          constraints: const BoxConstraints(
              maxWidth: 480
          ),
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.white,fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}
