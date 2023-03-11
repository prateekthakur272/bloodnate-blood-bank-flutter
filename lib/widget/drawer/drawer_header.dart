import 'package:bloodnate/auth.dart';
import 'package:flutter/material.dart';
class DrawerHomeHeader extends StatelessWidget {
  const DrawerHomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration:BoxDecoration(
            color: Colors.red[200],
        ), child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Auth.user?.displayName??"No name",
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold
                ),
              ),
              Text(
                Auth.user?.email??"No Email",
                style: const TextStyle(
                    fontSize: 16,
                ),
              )
            ],
          )
        ),
    );
  }
}
