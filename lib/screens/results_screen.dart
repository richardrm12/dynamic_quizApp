import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.restartQuiz,
      {super.key, required this.chosenAnswers});

  final VoidCallback restartQuiz;
  final List<String> chosenAnswers;

  List<Map<String, Object>> summaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': chosenAnswers[i]
      });
    }
    return summary;
  }

  int countCorrectAnswers() {
    int numCorrectAnswers = 0;
    for (int i = 0; i < chosenAnswers.length; i++) {
      if (questions[i].answers[0] == chosenAnswers[i]) {
        numCorrectAnswers++;
      }
    }
    return numCorrectAnswers;
  }

  @override
  Widget build(BuildContext context) {
    final int numCorrectAnswers = countCorrectAnswers();
    final int totalQuestions = questions.length;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CorrectAnswersCount(
              numCorrectAnswers: numCorrectAnswers,
              totalQuestions: totalQuestions),
          const SizedBox(height: 20),
          QuestionsSummary(summaryData()),
          const SizedBox(height: 20),
          RestartQuizButton(restartQuiz: restartQuiz)
        ],
      ),
    );
  }
}

class CorrectAnswersCount extends StatelessWidget {
  const CorrectAnswersCount({
    super.key,
    required this.numCorrectAnswers,
    required this.totalQuestions,
  });

  final int numCorrectAnswers;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 350,
      child: Text(
        'You answered $numCorrectAnswers out of $totalQuestions questions correctly!',
        textAlign: TextAlign.center,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
    );
  }
}

class RestartQuizButton extends StatelessWidget {
  const RestartQuizButton({
    super.key,
    required this.restartQuiz,
  });

  final VoidCallback restartQuiz;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: restartQuiz,
      child: const Text('Restart Quiz'),
    );
  }
}
