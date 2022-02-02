import 'package:quiz_app/models/enums/difficulty.dart';
import 'package:quiz_app/models/questionsData.dart';

abstract class BaseQuizRepository {
  Future<List<Question>> getQuestions(
      {int numQuestions, int categoryId, Difficulty difficulty});
}
