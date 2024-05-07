import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_bank.dart';

QuizBank quizBank = QuizBank();

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuizPage(),
            ),
          )),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    quizBank.getQuestionText(),
                    style: TextStyle(color: Colors.white),
                  )),
            )),
        ElevatedButton(
          onPressed: () async {
            checkAnswer(true, context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
            // Background color of the button// Optional padding
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10)), // Optional:// rounded corners
          ),
          child: const Text(
            'True',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () async {
            checkAnswer(false, context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            // Background color of the button// Optional padding
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(10)), // Optional:// rounded corners
          ),
          child: const Text(
            'False',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }

  void checkAnswer(bool userChosenAnswer, BuildContext context) {
    bool correctAnswer = quizBank.getCorrectAnswer();
    setState(() {
      if (userChosenAnswer == correctAnswer) {
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green));
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red));
      }
      quizBank.nextQuestion(context);
    });
  }
}
