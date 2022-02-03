import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

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

    List<dynamic> itemsList = list.map((i) => (i)).toList();

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
          // IconButton(
          //   icon: const Icon(Icons.emoji_emotions),
          //   onPressed: () {
          PopupMenuButton(
              child: const Icon(Icons.emoji_emotions),
              itemBuilder: (context) {
                return List.generate(5, (index) {
                  return const PopupMenuItem(child: Text("Hello"));
                });
              }),
          // },
          // ),
          const SizedBox(width: 15)
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(height: 30),
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.questions[3]['question']);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
              const SizedBox(height: 30),
              const InkWell(
                child: Text("Answer1"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
