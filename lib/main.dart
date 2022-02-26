import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quiz/quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(quizz());

class quizz extends StatelessWidget {
  const quizz({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10.0),
          child: QuizPage(),
        )),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> ScoreKeeper = [];

  void checkAnswer(bool userPickAnswer) {
    bool correctAnswer = quizBrain.getQuestionAnswer();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "ALERT",
          desc: "You\'ve reached the end of the quiz",
          buttons: [
            DialogButton(
              child: const Text(
                "RESET",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              width: 120,
            )
          ],
        ).show();

        quizBrain.reset();

        ScoreKeeper = [];
      } else {
        if (userPickAnswer == correctAnswer) {
          ScoreKeeper.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          ScoreKeeper.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestionNumber();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25.0, color: Colors.white),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.fromLTRB(100, 10, 50, 10),
              primary: Colors.white,
              backgroundColor: Colors.green,
            ),
            onPressed: () {
              checkAnswer(true);
            },
            child: const Text(
              "True",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        Expanded(
          child: TextButton(
            style: TextButton.styleFrom(
              // padding: const EdgeInsets.fromLTRB(100, 10, 50, 10),
              primary: Colors.white,
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              checkAnswer(false);

            },
            child: const Text(
              "False",
              style: TextStyle(color: Colors.white, fontSize: 30.0),
            ),
          ),
        ),
        Row(
          children: ScoreKeeper,
        )
      ],
    );
  }
}
