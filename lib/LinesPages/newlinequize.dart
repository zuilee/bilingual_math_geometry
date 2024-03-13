import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Final Quiz - Lines'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GeometryLinesQuizPage()),
            );
          },
          child: Text('Start Quiz'),
        ),
      ),
    );
  }
}

class GeometryLinesQuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry - Lines Quiz'),
      ),
      body: GeometryLinesQuiz(),
    );
  }
}

class GeometryLinesQuiz extends StatefulWidget {
  @override
  _GeometryLinesQuizState createState() => _GeometryLinesQuizState();
}

class _GeometryLinesQuizState extends State<GeometryLinesQuiz> {
  // Questions and Answers
  final List<String> questions = [
    'What is the equation of a horizontal line?',
    'What is the equation of a vertical line?',
    'What is the slope of a horizontal line?',
    'What is the slope of a vertical line?',
    'What is the slope-intercept form of a line equation?',
  ];

  final List<List<String>> options = [
    ['y = c', 'x = c', 'y = mx + c', 'x = mx + c'],
    ['y = c', 'x = c', 'y = mx + c', 'x = mx + c'],
    ['0', '1', 'Undefined', 'Infinity'],
    ['0', '1', 'Undefined', 'Infinity'],
    ['y = mx + b', 'y = mx', 'y = bx', 'y = mx^2 + b'],
  ];

  final List<int> answers = [1, 3, 0, 2, 0]; // Index of correct option for each question
  int questionIndex = 0;
  int score = 0;

  void checkAnswer(int selectedIndex) {
    if (selectedIndex == answers[questionIndex]) {
      setState(() {
        score++;
      });
    }
    if (questionIndex < questions.length - 1) {
      setState(() {
        questionIndex++;
      });
    } else {
      // Navigate to ScorePage
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScorePage(score: score, totalQuestions: questions.length)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Question ${questionIndex + 1}/${questions.length}',
          style: TextStyle(fontSize: 20),
        ),
        SizedBox(height: 20),
        Text(
          questions[questionIndex],
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Column(
          children: options[questionIndex].map((option) {
            int index = options[questionIndex].indexOf(option);
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: ElevatedButton(
                onPressed: () {
                  checkAnswer(index);
                },
                child: Text(option),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ScorePage extends StatelessWidget {
  final int score;
  final int totalQuestions;

  ScorePage({required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Score'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score/$totalQuestions',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                // Navigate back to PAGE3.dart
                Navigator.popUntil(context, ModalRoute.withName('/PAGE3'));
              },
              child: Text('Go back to Front page'),
            ),
          ],
        ),
      ),
    );
  }
}