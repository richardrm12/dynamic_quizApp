import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(
    this.startQuiz, {
    super.key,
  });

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.only(right: 25),
            child: Image(
              image: AssetImage('assets/images/quiz-logo.png'),
              width: 250,
            ),
          ),
          const Padding(padding: EdgeInsets.only(bottom: 25)),
          const Text(
            'QUIZARD',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 80,
          ),
          SizedBox(
            height: 50,
            width: 150,
            child: ElevatedButton(
              onPressed: startQuiz,
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all<Color>(const Color(0xff171550)),
              ),
              child: const Text(
                'Empezar',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}
