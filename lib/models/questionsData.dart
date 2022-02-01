class questionsData {
  String questions;
  questionsData({required this.questions});

  static questionsData fromJson(json) =>
      questionsData(questions: json['question']);
}
