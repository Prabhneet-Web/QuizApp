import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Widget options;
  final Color optionColor;
  final Function answerTap;
  Answer(
      {Key? key,
      required this.options,
      required this.optionColor,
      required this.answerTap})
      : super(key: key);

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: answerTap(),
      borderRadius: BorderRadius.circular(20),
      child: Container(
          padding: const EdgeInsets.all(13.0),
          margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
          width: double.infinity,
          decoration: BoxDecoration(
              // color: widget.optionColor,
              border: Border.all(color: optionColor),
              borderRadius: BorderRadius.circular(20)),
          child: options),
    );
  }
}
