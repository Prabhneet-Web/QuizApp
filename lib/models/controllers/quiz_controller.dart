import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:quiz_app/models/controllers/quiz_state.dart';
import 'package:quiz_app/models/questionsData.dart';

final quizControllerProvider =
    StateNotifierProvider.autoDispose((ref) => QuizController());

class QuizController extends StateNotifier<QuizState> {
  QuizController() : super(QuizState.initial());
  void submitAnswer(Question currentQuestion, String answer) {
    if (state.answered) return;
    if (currentQuestion.correctAnswer == answer) {
      state = state.copyWith(
          selectedAnswer: answer,
          correct: state.correct..add(currentQuestion),
          status: QuizStatus.correct,
          incorrect: []);
    } else {
      state = state.copyWith(
          selectedAnswer: answer,
          correct: [],
          incorrect: state.incorrect..add(currentQuestion),
          status: QuizStatus.incorrect);
    }
  }

  void nextQuestion(List<Question> questions, int currentIndex) {
    state = state.copyWith(
        selectedAnswer: '',
        correct: [],
        incorrect: [],
        status: currentIndex + 1 < questions.length
            ? QuizStatus.initial
            : QuizStatus.complete);
  }

  void reset() {
    state = QuizState.initial();
  }
}
