import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(
    this.function,
    this.text, {
    super.key,
  });

  final VoidCallback function;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 300,
          child: ElevatedButton(
              onPressed: function,
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  minimumSize: const Size(300, 50)),
              child: Text(
                text,
                textAlign: TextAlign.center,
              )),
        ),
        const Padding(padding: EdgeInsetsDirectional.only(bottom: 10))
      ],
    );
  }
}
