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
          IconButton(
            icon: const Icon(Icons.emoji_emotions),
            onPressed: () {},
          ),
          const SizedBox(width: 15)
        ],
      ),
      body: Container()
    );
  }
}

