import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'drawer_header.dart';
class DrawerHome extends StatelessWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:[
          const DrawerHomeHeader(),
          ListTile(
            title: const Text("Sign out"),
            onTap: () async {
              Navigator.pop(context);
              await FirebaseAuth.instance.signOut().then((value) => {
                Navigator.popUntil(context,ModalRoute.withName('/')),
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                    content: Text("Signed out successfully"),
                  )
                )
              });
            },
          ),
          const Divider(thickness: 1,),
          const ListTile(
            title: Text("Version 1.0"),
          ),
        ],
      ),
    );
  }
}
