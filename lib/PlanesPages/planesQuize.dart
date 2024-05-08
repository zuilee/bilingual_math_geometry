import 'package:flutter/material.dart';

void main() {
  runApp(PlaneQuizApp());
}

class PlaneQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plane Quiz',
      debugShowCheckedModeBanner: false,
      home: PlaneQuizPage(),
    );
  }
}

class PlaneQuizPage extends StatefulWidget {
  @override
  _PlaneQuizPageState createState() => _PlaneQuizPageState();
}

class _PlaneQuizPageState extends State<PlaneQuizPage> {
  final List<String> questions = [
    'What are the types of planes?',
    'What is true about horizontal plane?',
    'What is a not belong to vertical plane?',
    'What is an inclined plane?',
    'All planes in geometry extend infinitely in all directions. True or False ?'
  ];

  final List<List<String>> options = [
    ['Horizontal, vertical, inclined', 'Parallel, perpendicular, oblique', 'Acute, obtuse, right'],
    ['A plane that is parallel to the ground', 'A plane that is perpendicular to the ground', 'A plane that is at an angle to the ground'],
    ['Bookshelf', 'Door', 'Wall', 'Table top'],
    ['A plane that is at an angle to the ground', 'A plane that is parallel to the ground', 'A plane that is perpendicular to the ground'],
    ['True', 'False']
  ];

  final List<String> answers = [
    'Horizontal, vertical, inclined',
    'A plane that is parallel to the ground',
    'A plane that is perpendicular to the ground is a verticle plane',
    'Think about example of Ramp',
    'True'
  ];

  final List<String> hints = [
    'Think of a sheet of paper.',
    'The types are based on the orientation of the plane.',
    'Examples include the surface of a table or the horizon.',
    'Examples include the walls of a room or a mirror.',
    'Examples include a ramp or a roof.',
    'Remember the defination of plane.'
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
                            content: Text('Congratulations! You completed the quiz.'),
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
        title: Text('Plane Quiz'),
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