import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Icon> _scoreTracker = [
    // Icon(Icons.check_sharp),
    // Icon(Icons.clear_outlined)
  ];
  int _questionIndex = 0;
  int _totalScore = 0;

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  List _questions = [];
  List _answers = [];
  Future<void> loadJsonData() async {
    final questionsJson =
        await rootBundle.loadString("lib/assets/JSON/questions.json");
    final data = await json.decode(questionsJson);
    setState(() {
      _questions = data("question");
      _answers = data("answers");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(100))),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: SizedBox(),
        ),
        backgroundColor: const Color.fromARGB(255, 200, 152, 67),
        title: const Text(
          "Quiz Game",
        ),
        centerTitle: true,
        actions: [
          IconButton(icon: const Icon(Icons.emoji_emotions), onPressed: () {}),
          const SizedBox(width: 15)
        ],
      ),
      body: Center(
          child: Column(children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            if (_scoreTracker.isEmpty) Container(height: 30.0),
            if (_scoreTracker.isNotEmpty) ..._scoreTracker
          ],
        ),
        _questions.isNotEmpty
            ? Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(
                    bottom: 10.0, left: 30.0, right: 30.0),
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(20)),
                child: Center(
                    child: Text(
                  _answers[1]["answerText"],
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20.0, color: Colors.black),
                )),
              )
            : Container(),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black)),
            child: Text(
              "Answer",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(15.0),
            margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black)),
            child: Text(
              "Answer",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            padding: EdgeInsets.all(15.0),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 30.0),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.black)),
            child: Text(
              "Answer",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(shadowColor: Colors.amber),
          onPressed: () {},
          child: Text("Next Question"),
        ),
        Container(
          padding: const EdgeInsets.only(
              left: 20.0, right: 20.0, bottom: 20.0, top: 10.0),
          child: const Text(
            "0/9",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        )
      ])),
    );
  }
}

// final _questions = const [
//   {
//     'question': 'How long is New Zealand\'s Ninety Mile Beach?',
//     'answers': [
//       {'answerText': '88km, so 55 miles long.', 'score': true},
//       {'answerText': '55km, so 34 miles long.', 'score': false},
//       {'ansertText': '90km, so 56 miles long.', 'score': false}
//     ]
//   },
//   {
//     'question':
//         'In which month does the German festival of Oktoberfest mostly take place?',
//     'answers': [
//       {'answerText': 'January', 'score': false},
//       {'answerText': 'October', 'score': false},
//       {'ansertText': 'September', 'score': true}
//     ]
//   },
//   {
//     'question': 'Who composed the music for Sonic the Hedgehog 3?',
//     'answers': [
//       {'answerText': 'Britney Spears', 'score': false},
//       {'answerText': 'Timbaland', 'score': false},
//       {'ansertText': 'Michael Jackson', 'score': true}
//     ]
//   },
//   {
//     'question': 'In which country are Panama hats made?',
//     'answers': [
//       {'answerText': 'Ecuador', 'score': true},
//       {'answerText': 'Panama(duh)', 'score': false},
//       {'ansertText': 'Portugal', 'score': false}
//     ]
//   },
//   {
//     'question': 'From which country do French fries originate?',
//     'answers': [
//       {'answerText': 'Belgium', 'score': true},
//       {'answerText': 'France(duh)', 'score': false},
//       {'ansertText': 'Switzerland', 'score': false}
//     ]
//   },
//   {
//     'question': 'Which sea creature has three hearts?',
//     'answers': [
//       {'answerText': 'Great White Sharks', 'score': false},
//       {'answerText': 'Killer Whales', 'score': false},
//       {'ansertText': 'The Octupus', 'score': true}
//     ]
//   },
//   {
//     'question': 'Which European country eats the most chocolate per capita?',
//     'answers': [
//       {'answerText': 'Belgium', 'score': false},
//       {'answerText': 'The Netherlands', 'score': false},
//       {'ansertText': 'Switzerland', 'score': true}
//     ]
//   }
// ];

