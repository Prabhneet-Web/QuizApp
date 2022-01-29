import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/Quiz2.webp"),
              fit: BoxFit.cover)),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.6),
            Colors.black.withOpacity(0.2)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          )),
    ));
  }
}
