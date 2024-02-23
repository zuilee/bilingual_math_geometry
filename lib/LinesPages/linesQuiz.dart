import 'package:flutter/material.dart';
import 'linesSectionPage.dart';

void main() {
  runApp(LineFinalQuizApp());
}

class LineFinalQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line Quiz',
      debugShowCheckedModeBanner: false,
      home: LineFinalQuizPage(),
    );
  }
}

class LineFinalQuizPage extends StatefulWidget {
  @override
  _LineFinalQuizPageState createState() => _LineFinalQuizPageState();
}

class _LineFinalQuizPageState extends State<LineFinalQuizPage> {
  final List<String> questions = [
    'What is the definition of a line?',
    'What are the two main characteristics of a line?',
    'What are the different types of lines?',
    'What is a ray?',
    'What is a line segment?'
  ];

  final List<List<String>> options = [
    ['A straight path with infinite length.', 'A curved path with finite length.', 'A circle.'],
    ['Length and no width.', 'Length and color.', 'Length and height.'],
    ['Straight line, ray, line segment.', 'Curved line, zigzag line, wave line.', 'Circle, oval, square.'],
    ['A part of a line with one endpoint.', 'A part of a line with two endpoints.', 'A line with infinite endpoints.'],
    ['A part of a line with two endpoints.', 'A part of a line with one endpoint.', 'A straight path with infinite length.']
  ];

  final List<String> answers = [
    'A straight path with infinite length.',
    'Length and no width.',
    'Straight line, ray, line segment.',
    'A part of a line with one endpoint.',
    'A part of a line with two endpoints.'
  ];

  final List<String> hints = [
    'Think of a ruler.',
    'One of them is about shape, and the other is about dimension.',
    'One type is straight, another type has only one endpoint, and another type has two endpoints.',
    'It starts from a point and extends infinitely in one direction.',
    'It connects two points on the line.'
  ];

  int currentQuestionIndex = 0;
  int attemptsLeft = 3;
  String? selectedOption;

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
                    // Display a congratulatory message or navigate to a new page
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Quiz Finished!'),
                          content: Text('Congratulations! You completed the quiz.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                MaterialPageRoute(builder: (context) => LinesSectionsPage());
                                // Reset quiz or navigate to a new page
                              },
                              child: Text('OK'),
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
                      // Display a congratulatory message or navigate to a new page
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Quiz Finished!'),
                            content: Text('Congratulations! You completed the quiz.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  // Reset quiz or navigate to a new page
                                },
                                child: Text('OK'),
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
        title: Text('Line Quiz'),
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