import 'package:bloodnate/database/repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../auth.dart';
class ProfileCard extends StatelessWidget {
  ProfileCard({Key? key}) : super(key: key);
  final User user = Auth.user!;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
            maxWidth: 480
        ),
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/img_donate.png'),
            Text(
              user.displayName??"No Name",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Divider(thickness: 1,color: Colors.grey,),
            Text(user.email!),
            Text(user.emailVerified?"Verified":"Not verified"),
            FutureBuilder(
              future: Repository.getUser(),
                builder: (BuildContext context,AsyncSnapshot<Map<String, dynamic>> map){
                if(map.hasData && map.data!.isNotEmpty){
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(map.data?['address']??"update address"),
                        Text(map.data?['pin_code']??"update pin code"),
                        Text(map.data?['blood_group']??"update blood group"),
                      ],
                    );
                  }
                  if(map.hasError){
                    return const Text("Some error occurred");
                  }
                  return const Text("Loading...");
                }
            ),
          ],
        ),
      ),
    );
  }
}
