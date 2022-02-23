import 'package:flutter/material.dart';

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
  List<Icon> ScoreKeeper = [  ];

  List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet',
    'A slug\'s blood is green'
  ];
  int questionNumber = 0;

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
              questions[questionNumber],
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
              setState(() {
                ScoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
                questionNumber++;
              });
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
              setState(() {
                ScoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
                questionNumber++;
              });
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
