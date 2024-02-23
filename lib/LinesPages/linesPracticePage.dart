import 'package:flutter/material.dart';
import 'linesSectionPage.dart';

void main() {
  runApp(LinesPracticeQuiz());
}

class LinesPracticeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lines Quiz',
      debugShowCheckedModeBanner: false,
      home: LinesQuizPage(),
    );
  }
}

class LinesQuizPage extends StatefulWidget {
  @override
  _LinesQuizPageState createState() => _LinesQuizPageState();
}

class _LinesQuizPageState extends State<LinesQuizPage> {
  int _score = 0;
  int _questionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is a line?',
      'answers': [
        {'text': 'A curve', 'correct': false},
        {'text': 'A straight path', 'correct': true},
        {'text': 'A circle', 'correct': false},
      ],
    },
    {
      'question': 'What is a ray?',
      'answers': [
        {'text': 'Part of a line with two endpoints', 'correct': false},
        {'text': 'Part of a line with one endpoint', 'correct': true},
        {'text': 'A straight path', 'correct': false},
      ],
    },
    {
      'question': 'What is a line segment?',
      'answers': [
        {'text': 'Part of a line with one endpoint', 'correct': false},
        {'text': 'Part of a line with two endpoints', 'correct': true},
        {'text': 'A straight path', 'correct': false},
      ],
    },
  ];

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _questionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lines Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LinesSectionsPage()), // Navigate back to PAGE2.dart
                ); // Navigate back when arrow is pressed
              },
            ),

      ),
      body: _questionIndex < _questions.length
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _questions[_questionIndex]['question'],
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                ...(_questions[_questionIndex]['answers'] as List<Map<String, dynamic>>).map((answer) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ElevatedButton(
                      onPressed: () => _answerQuestion(answer['correct']),
                      child: Text(answer['text']),
                    ),
                  );
                }).toList(),
              ],
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Completed!',
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'Your Score: $_score/${_questions.length}',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: _resetQuiz,
                    child: Text('Restart Quiz'),
                  ),
                ],
              ),
            ),
    );
  }
}