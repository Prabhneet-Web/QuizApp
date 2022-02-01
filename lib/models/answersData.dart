import 'package:flutter/material.dart';

class answersData {
  String answerText;
  bool score;
  answersData({required this.answerText, required this.score});

  static answersData fromJson(json) =>
      answersData(answerText: json['answerText'], score: json['score']);
}
