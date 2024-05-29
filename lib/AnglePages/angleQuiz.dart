import 'package:flutter/material.dart';

void main() {
  runApp(AngleQuizApp());
}

class AngleQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angle Quiz',
      debugShowCheckedModeBanner: false,
      home: AngleQuizPage(),
    );
  }
}

class AngleQuizPage extends StatefulWidget {
  @override
  _AngleQuizPageState createState() => _AngleQuizPageState();
}

class _AngleQuizPageState extends State<AngleQuizPage> {
  final List<String> questions = [
    'What is the measure of a right angle?',
    'What is the measure of an acute angle?',
    'What is the measure of an obtuse angle?',
    'What is a straight angle?',
    'What is the measure of a complete angle?'
  ];

  final List<List<String>> options = [
    ['90 degrees', '45 degrees', '120 degrees'],
    ['Less than 90 degrees', 'Exactly 90 degrees', 'More than 90 degrees'],
    ['More than 90 degrees', 'Exactly 90 degrees', 'Less than 90 degrees'],
    ['180 degrees', '90 degrees', '360 degrees'],
    ['360 degrees', '180 degrees', '90 degrees']
  ];

  final List<String> answers = [
    '90 degrees',
    'Less than 90 degrees',
    'More than 90 degrees',
    '180 degrees',
    '360 degrees'
  ];

  final List<String> hints = [
    'Think of the corners of a square.',
    'It\'s smaller than a right angle.',
    'It\'s larger than a right angle but less than a straight angle.',
    'It\'s a straight line.',
    'It\'s a full rotation.'
  ];

  int currentQuestionIndex = 0;
  int attemptsLeft = 3;
  String? selectedOption;
  int score = 0; // Variable to track the score

  void showHint() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hint'),
          content: Text(hints[currentQuestionIndex]),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void checkAnswer() {
    if (selectedOption != null && selectedOption == answers[currentQuestionIndex]) {
      setState(() {
        score += 5; // Increment score by 5 points for each correct answer
      });
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Correct!'),
            content: Text('Well done!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  if (currentQuestionIndex < questions.length - 1) {
                    setState(() {
                      currentQuestionIndex++;
                      attemptsLeft = 3;
                      selectedOption = null;
                    });
                  } else {
                    // Quiz finished
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Quiz Finished!'),
                          content: Text('Congratulations! You completed the quiz. Your score is $score.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop(); // Navigate back to the front page
                              },
                              child: Text('Back to Home'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text('Next'),
              ),
            ],
          );
        },
      );
    } else {
      attemptsLeft--;
      if (attemptsLeft <= 0) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incorrect'),
              content: Text('You have no attempts left. The correct answer is:\n\n${answers[currentQuestionIndex]}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    if (currentQuestionIndex < questions.length - 1) {
                      setState(() {
                        currentQuestionIndex++;
                        attemptsLeft = 3;
                        selectedOption = null;
                      });
                    } else {
                      // Quiz finished
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Quiz Finished!'),
                            content: Text('Congratulations! You completed the quiz. Your score is $score.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop(); // Navigate back to the front page
                                },
                                child: Text('Back to Home'),
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: Text('Next'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Incorrect'),
              content: Text('Try again. You have $attemptsLeft attempts left.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Angle Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                'Score: $score',
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: options[currentQuestionIndex].map((option) {
                return RadioListTile<String>(
                  title: Text(option),
                  value: option,
                  groupValue: selectedOption,
                  onChanged: (String? value) {
                    setState(() {
                      selectedOption = value;
                    });
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                showHint();
              },
              child: Text('Hint'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {
                checkAnswer();
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
