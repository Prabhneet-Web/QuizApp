import 'dart:convert';
import 'dart:async' show Future;
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/assets/widgets/answers.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

Future<Album> fetchAlbum() async {
  final response = await http.get(Uri.parse(
      'https://opentdb.com/api.php?amount=10&category=18&difficulty=medium&type=multiple'));

  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Question {
  final String question;
  final String correctAnswer;
  final List<String> incorrectAnswers;

  const Question({
    required this.question,
    required this.correctAnswer,
    required this.incorrectAnswers,
  });

  factory Question.fromJson(Map<String, dynamic> json) {
    return Question(
      correctAnswer: json['correct_answer'],
      incorrectAnswers: json['incorrect_answers'],
      question: json['question'],
    );
  }
}

class Album {
  final List<dynamic> questions;

  const Album({
    required this.questions,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    var list = json['results'] as List;

    List<dynamic> itemsList = list.map((i) {
      List<dynamic> answers = i["incorrect_answers"];
      answers.add(i["correct_answer"]);
      answers.shuffle(Random());
      i["incorrect_answers"] = answers;
      return i;
    }).toList();

    return Album(
      questions: itemsList,
    );
  }
}

class _FirstPageState extends State<FirstPage> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  List<Icon> __scoreTracker = [];
  int _questionIndex = 0;
  int _totalScore = 0;

  // final pageController = usePageController();

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
          style: TextStyle(fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
              child: const Icon(Icons.emoji_emotions),
              itemBuilder: (context) {
                return List.generate(5, (index) {
                  return const PopupMenuItem(child: Text("Hello"));
                });
              }),
          const SizedBox(width: 15)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 35),
          child: Column(
            children: [
              Row(
                children: [
                  if (__scoreTracker.length == 0) SizedBox(height: 20),
                  if (__scoreTracker.length > 0) ...__scoreTracker
                ],
              ),
              const SizedBox(height: 30),
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(
                        snapshot.data!.questions[_questionIndex]['question'],
                        style: const TextStyle(fontSize: 17));
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 25),
              Answer(
                options: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data!.questions[_questionIndex]
                              ['incorrect_answers'][0],
                          style: const TextStyle(fontSize: 17));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Answer(
                options: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data!.questions[_questionIndex]
                              ['incorrect_answers'][1],
                          style: const TextStyle(fontSize: 17));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Answer(
                options: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data!.questions[_questionIndex]
                              ['incorrect_answers'][2],
                          style: const TextStyle(fontSize: 17));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              Answer(
                options: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Text(
                          snapshot.data!.questions[_questionIndex]
                              ['incorrect_answers'][3],
                          style: const TextStyle(fontSize: 17));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 200, 152, 67),
                    borderRadius: BorderRadius.circular(30)),
                child: MaterialButton(
                  onPressed: () {
                    setState(() {
                      _questionIndex++;
                      if (_questionIndex >= 9) _questionIndex = 9;
                    });
                  },
                  child: const Text("Next Question",
                      style: TextStyle(fontSize: 15)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
