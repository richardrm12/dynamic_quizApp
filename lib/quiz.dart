import 'package:flutter/material.dart';
import 'package:quiz_app/screens/questions_screen.dart';
import 'package:quiz_app/screens/results_screen.dart';
import 'package:quiz_app/screens/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  var activeScreen = 'start-screen';
  List<String> selectedAnswers = [];

  void startQuiz() {
    setState(() {
      activeScreen = 'questions-screen';
      selectedAnswers = [];
    });
  }

  void endQuiz() {
    setState(() {
      activeScreen = 'end-screen';
    });
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'start-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(startQuiz);

    switch (activeScreen) {
      case 'start-screen':
        screenWidget = StartScreen(startQuiz);
        break;
      case 'questions-screen':
        screenWidget =
            QuestionsScreen(endQuiz, selectedAnswers: selectedAnswers);
        break;
      case 'end-screen':
        screenWidget = ResultsScreen(
          restartQuiz,
          chosenAnswers: selectedAnswers,
        );
        break;
      default:
    }

    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xff2E2C6D),
        body: screenWidget,
      ),
    );
  }
}
