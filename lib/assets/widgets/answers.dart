import 'package:flutter/material.dart';

class Answer extends StatefulWidget {
  Widget options;
  Answer({
    Key? key,
    required this.options,
  }) : super(key: key);

  @override
  State<Answer> createState() => _AnswerState();
}

class _AnswerState extends State<Answer> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          padding: const EdgeInsets.all(13.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          width: double.infinity,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(20)),
          child: widget.options),
    );
  }
}
