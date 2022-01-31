import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:quiz_app/pages/firstPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 10));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void onTap() {
    _animationController.forward().then((f) => Navigator.push(
        context,
        PageTransition(
            child: const FirstPage(),
            type: PageTransitionType.rotate,
            alignment: Alignment.bottomCenter)));
  }

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
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.2)
          ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  "Let's Play Quiz!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 60,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 12,
                    height: 100,
                  ),
                  const Text("Play To",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 15),
                  AnimatedTextKit(animatedTexts: [
                    RotateAnimatedText("WIN!",
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Horizon")),
                    RotateAnimatedText("LOSE!",
                        textStyle: const TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontFamily: "Horizon"))
                  ], isRepeatingAnimation: true, totalRepeatCount: 50)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 15.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(255, 200, 152, 67),
                        Color.fromARGB(255, 255, 219, 143)
                      ])),
                  child: MaterialButton(
                    onPressed: () => onTap(),
                    minWidth: double.infinity,
                    child: const Text(
                      "Start",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Play to Answer Some of the Random Questions!",
                style: TextStyle(color: Colors.white60),
              ),
              const SizedBox(height: 30)
            ],
          )),
    ));
  }
}
