import 'package:bloodnate/widget/button.dart';
import 'package:bloodnate/widget/card.dart';
import 'package:bloodnate/widget/drawer/drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Bloodnate'),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 480
            ),
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Image.asset('assets/img_bloodnate.png',width: 160,height: 160,),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Button("Donate blood", (){}),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                Button("Find blood", (){}),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16)),
                const InfoCard()
              ],
            ),
          ),
        ),
      ),
      drawer:const DrawerHome()
    );
  }
}