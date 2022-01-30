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
              image: AssetImage("lib/assets/images/Quiz4.jpg"),
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
                    height: 170,
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
              ),
              Container(
                padding: EdgeInsets.only(left: 8, right: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(colors: [
                      Color.fromARGB(255, 200, 152, 67),
                      Color.fromARGB(255, 255, 219, 143)
                    ])),
                child: MaterialButton(
                  onPressed: () {},
                  minWidth: double.infinity,
                  child: const Text(
                    "Start",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              )
            ],
          )),
    ));
  }
}
