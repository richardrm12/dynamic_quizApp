import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';
import 'package:quiz_app/widgets/answer_button.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.endQuiz,
      {super.key, required this.selectedAnswers});

  final VoidCallback endQuiz;

  final List<String> selectedAnswers;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> selectedAnswers = [];

  void _answerQuestion(String answer) {
    setState(() {
      widget.selectedAnswers.add(answer);
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        widget.endQuiz();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    List<String> shuffledAnswers = List.from(currentQuestion.answers);
    shuffledAnswers.shuffle();
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          QuestionCard(
            questionText: currentQuestion.text,
          ),
          const SizedBox(height: 80),
          ...shuffledAnswers.map(
            (answer) {
              return AnswerButton(() => _answerQuestion(answer), answer);
            },
          )
        ],
      ),
    );
  }
}

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    required this.questionText,
    super.key,
  });

  final String questionText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 350,
      child: Container(
        decoration: const BoxDecoration(
            color: Color(0xff171550),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
            child: Text(
          questionText,
          style: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          textAlign: TextAlign.center,
        )),
      ),
    );
  }
}
