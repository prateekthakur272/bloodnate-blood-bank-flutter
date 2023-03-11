import 'package:flutter/material.dart';
class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 480
        ),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
                "Did you know?",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text("Just 1 donation can save up to 3 lives."),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text("More than 38,000 blood donations are needed every day."),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text("Type O-negative whole blood can be transfused to people with any blood type, but this type of blood is rare, and supplies of it are low."),
            Padding(padding: EdgeInsets.symmetric(vertical: 4)),
            Text("Type AB plasma can be transfused to patients with all other blood types, but it's also in short supply.")
          ],
        ),
      ),
    );
  }
}
