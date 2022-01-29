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
              image: AssetImage("lib/assets/images/Quiz1.webp"),
              fit: BoxFit.cover)),
      child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(0.9),
            Colors.black.withOpacity(0.7),
            Colors.black.withOpacity(0.2)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                    height: 180,
                  ),
                  const Text("Play To",
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 15),
                  AnimatedTextKit(animatedTexts: [
                    RotateAnimatedText("WIN",
                        textStyle: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: "Horizon")),
                    RotateAnimatedText("LOSE",
                        textStyle: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: "Horizon"))
                  ], isRepeatingAnimation: true, totalRepeatCount: 30)
                ],
              )
            ],
          )),
    ));
  }
}
