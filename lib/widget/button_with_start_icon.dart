import 'package:flutter/material.dart';
class ButtonWithStartIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onClick;
  const ButtonWithStartIcon(this.text,this.icon,this.onClick,{Key? key}) : super(key: key);

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
          child: Center(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon,color: Colors.black),
                const Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                Text(
                  text,
                  style: const TextStyle(color: Colors.black),
                ),
              ],
            )
          ),
        ),
      ),
    );
  }
}
