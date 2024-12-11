import 'package:bilingual_math_geometry/LinesPages/linesSectionPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(LineQuizApp());
}

class LineQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lines Quiz',
      debugShowCheckedModeBanner: false,
      home: LineQuizPage(),
    );
  }
}

class LineQuizPage extends StatefulWidget {
  @override
  _LineQuizPageState createState() => _LineQuizPageState();
}

class _LineQuizPageState extends State<LineQuizPage> {
  final List<String> questions = [
    'You are standing at the edge of a straight road that extends as far as you can see. What is the best geometric representation of this road?',
    'A flashlight is turned on in a dark room, emitting light in one direction. How can the path of light from the flashlight be represented?',
    'You are measuring the length of a wooden stick with a ruler. What geometric concept does the stick represent?',
    'Two railroad tracks run side by side and never meet, no matter how far they extend. How are these tracks geometrically classified?',
    'A flagpole stands upright on flat ground. The pole and the ground meet at a right angle. How can this arrangement be described geometrically?',
    'Two roads cross each other at an intersection but do not form right angles. What is the geometric relationship between these roads?',
    'A basketball court has markings for the free throw lane. The sidelines of the court never touch, while the baseline and the sideline meet at a right angle. Which types of lines are the two sidelines and the sidelines and the baseline?',
    'A ladder leans against a wall. The wall is vertical, and the ground is horizontal. The ladder forms a triangle with the wall and the ground. Which two lines are perpendicular in this scenario?',
    'In a city grid system, the main street runs north-south, and cross streets run east-west. What is the relationship between the main street and any one of the cross streets?',
    'You are driving on a highway with two lanes going in the same direction. These lanes run side by side without ever meeting. How can the geometric relationship between these lanes be described?',
  ];

  final List<List<String>> options = [
    ['Line', 'Ray', 'Segment'],
    ['Line', 'Ray', 'Segment'],
    ['Line', 'Ray', 'Segment'],
    ['Perpendicular lines', 'Intersecting lines', 'Parallel line'],
    ['Parallel lines', 'Intersecting lines', 'Perpendicular lines'],
    ['Parallel lines', 'Perpendicular lines', 'Intersecting lines'],
    [
      'Parallel and Intersecting',
      'Parallel and Perpendicular',
      'Perpendicular and Intersecting'
    ],
    [
      'The ladder and the wall',
      'The ladder and the ground',
      'The wall and the ground'
    ],
    ['Parallel lines', 'Perpendicular lines', 'Rays'],
    ['Parallel lines', 'Perpendicular lines', 'Rays'],
  ];

  final List<String> answers = [
    'Line',
    'Ray',
    'Segment',
    'Parallel line',
    'Perpendicular lines',
    'Intersecting lines',
    'Parallel and Perpendicular',
    'Perpendicular lines',
    'Perpendicular lines',
    'Parallel lines',
  ];

  final List<String> hints = [
    'A road extends infinitely on both sides.',
    'The flashlight itself is one endpoint and the light extends infinitely in the direction it is pointed.',
    'The wooden stick has two endpoints.',
    'The railroads never meet.',
    'Angle formed between pole and ground is exactly 90 degrees.',
    'Angle between the two roads is not 90 degrees.',
    'The sidelines never meet. The baseline and sideline meet at a 90 degree angle.',
    'The wall and the ground meet at a 90 degree angle.',
    'he main street and cross streets meet at a 90 degree angle.',
    'The lanes never intersect.',
  ];

  final List<String> imagePath = [
    'assets/images/lines/quiz/lq1.webp',
    'assets/images/lines/quiz/lq2.jpg',
    'assets/images/lines/quiz/lq3.jpg',
    'assets/images/lines/quiz/lq4.jpg',
    'assets/images/lines/quiz/lq5.jpg',
    'assets/images/lines/quiz/lq6.jpg',
    'assets/images/lines/quiz/lq7.webp',
    'assets/images/lines/quiz/lq8.jpg',
    'assets/images/lines/quiz/lq9.jpg',
    'assets/images/lines/quiz/lq10.jpg',
  ];

  int currentQuestionIndex = 0;
  int attemptsLeft = 3;
  String? selectedOption;
  int score = 0;

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
    if (selectedOption != null &&
        selectedOption == answers[currentQuestionIndex]) {
      setState(() {
        score += 5;
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
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Quiz Finished!'),
                          content: Text(
                              'Congratulations! You completed the quiz. Your score is $score.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
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
              content: Text(
                  'You have no attempts left. The correct answer is:\n\n${answers[currentQuestionIndex]}'),
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
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Quiz Finished!'),
                            content: Text(
                                'Congratulations! You completed the quiz. Your score is $score.'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).pop();
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
        title: Text('Line Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LinesSectionsPage()), // Navigate back to PAGE2.dart
            ); // Navigate back when arrow is pressed
          },
        ),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imagePath[currentQuestionIndex], // Replace with your image path
              height: 350.0, // Increased image height
              width: double.infinity, // Set width to match screen
              fit: BoxFit.contain,
            ),
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
