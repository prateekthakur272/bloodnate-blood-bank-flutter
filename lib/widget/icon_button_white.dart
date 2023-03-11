import 'package:flutter/material.dart';
class IconButtonWhite extends StatelessWidget {
  final IconData icon;
  final Function onClick;
  const IconButtonWhite(this.icon,this.onClick,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black),
            borderRadius: const BorderRadius.all(Radius.circular(16)),
          ),
          child: Icon(icon),
        ),
      ),
    );
  }
}
