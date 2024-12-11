import 'package:flutter/material.dart';

void main() {
  runApp(TriangleQuizApp());
}

class TriangleQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Triangle Quiz',
      debugShowCheckedModeBanner: false,
      home: TriangleQuizPage(),
    );
  }
}

class TriangleQuizPage extends StatefulWidget {
  @override
  _TriangleQuizPageState createState() => _TriangleQuizPageState();
}

class _TriangleQuizPageState extends State<TriangleQuizPage> {
  final List<String> questions = [
    'You see a road sign shaped like a triangle. It has all sides of equal length. What type of triangle is the sign?',
    'The roof of a house has a triangular structure. The two sloping sides are equal in length, and the base is shorter. What type of triangle is the roof?',
    'A slice of watermelon is cut into a triangular shape where all three sides are of same lengths. What type of triangle is it?',
    'A handkerchief is folded into a triangular shape where all the angles are smaller than 90 degrees. What type of triangle does it represent?',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  final List<List<String>> options = [
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Obtuse-angled', 'Right-angled', 'Acute-angled'],
    ['Right-angled', 'Obtuse-angled', 'Acute-angled'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
    ['Equilateral', 'Isosceles', 'Scalene'],
  ];

  final List<String> answers = [
    'Equilateral',
    'Isosceles',
    'Equilateral',
    'Acute-angled',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  final List<String> hints = [
    'All three sides ane of equal length.',
    'Two sides are of equal lenghth.',
    'All three sides ane of equal length.',
    'All three angles are less than 60 degrees.',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];

  final List<String> imagePath = [
    'assets/images/triangles/quiz/tq1.webp',
    'assets/images/triangles/quiz/tq2.webp',
    'assets/images/triangles/quiz/tq3.jpg',
    'assets/images/triangles/quiz/tq4.jpg',
    '',
    '',
    '',
    '',
    '',
    '',
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
    if (selectedOption != null &&
        selectedOption == answers[currentQuestionIndex]) {
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
                          content: Text(
                              'Congratulations! You completed the quiz. Your score is $score.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                Navigator.of(context)
                                    .pop(); // Navigate back to the front page
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
                      // Quiz finished
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
                                  Navigator.of(context)
                                      .pop(); // Navigate back to the front page
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
        title: Text('Triangle Quiz'),
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
