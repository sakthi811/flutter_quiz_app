import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/question.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class QuizBank {
  int _questionNumber = 0;

  final List<Question> _questions = [
    Question('Some cats are actually allergic to humans', true),
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question('A slug\'s blood is green.', true),
    Question('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    Question('It is illegal to pee in the Ocean in Portugal.', true),
    Question(
        'No piece of square dry paper can be folded in half more than 7 times.',
        false),
    Question(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
        true),
    Question(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
        false),
    Question(
        'The total surface area of two human lungs is approximately 70 square metres.',
        true),
    Question('Google was originally called \"Backrub\".', true),
    Question(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
        true),
    Question(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
        true),
  ];

  String getQuestionText() {
    return _questions[_questionNumber].question;
  }

  bool getCorrectAnswer() {
    return _questions[_questionNumber].answer;
  }

  void nextQuestion(BuildContext context) {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    } else {
      Alert(
        context: context,
        type: AlertType.error,
        title: "Hurray!",
        desc: "You completed the Quiz Successfully.",
        buttons: [
          DialogButton(
            onPressed: () {
              resetQuiz();
              Navigator.pop(context);
            },
            width: 120,
            child: const Text(
              "Replay",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          DialogButton(
            onPressed: () => exit(0),
            width: 120,
            child: const Text(
              "Quit",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ],
      ).show();
    }
  }

  void resetQuiz() {
    _questionNumber = 0;
  }
}
