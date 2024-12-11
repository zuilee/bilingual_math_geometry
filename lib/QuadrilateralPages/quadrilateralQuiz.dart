import 'package:flutter/material.dart';

void main() {
  runApp(QuadrilateralQuizApp());
}

class QuadrilateralQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadrilateral Quiz',
      debugShowCheckedModeBanner: false,
      home: QuadrilateralQuizPage(),
    );
  }
}

class QuadrilateralQuizPage extends StatefulWidget {
  @override
  _QuadrilateralQuizPageState createState() => _QuadrilateralQuizPageState();
}

class _QuadrilateralQuizPageState extends State<QuadrilateralQuizPage> {
  final List<String> questions = [
    'Which of these is commonly used for a standard window pane, where all four sides are equal and every angle forms a perfect right angle?',
    'You are designing a table, and you want it to have opposite sides parallel and unequal in length, but with no right angles. What shape would best describe the tabletop?',
    'The wings of a traditional kite often form a shape where two pairs of adjacent sides are equal. What shape does the kite resemble?',
    'Which quadrilateral would be most appropriate for the screen of a modern TV or smartphone, where opposite sides are equal and each angle forms a right angle?',
    'In designing a fancy picture frame, you want all four sides to be of equal length and each angle to be a right angle. What shape best describes this frame?',
    'A book cover has a simple and practical design where opposite sides are parallel and equal, and all angles are right angles. What quadrilateral shape describes the book cover?',
    '',
    '',
    '',
  ];

  final List<List<String>> options = [
    ['Square', 'Rhombus', 'Trapezoid'],
    ['Parallelogram', 'Rectangle', 'Trapezoid'],
    ['Parallelogram', 'Kite', 'Trapezoid'],
    ['Parallelogram', 'Rectangle', 'Trapezoid'],
    ['Square', 'Rectangle', 'Kite'],
    ['Kite', 'Rectangle', 'Rhombus'],
    ['Parallelogram', 'Rectangle', 'Trapezoid'],
    ['Parallelogram', 'Rectangle', 'Trapezoid'],
    ['Parallelogram', 'Rectangle', 'Trapezoid'],
  ];

  final List<String> answers = [
    'Square',
    'Trapezoid',
    'Kite',
    'Rectangle',
    'Square',
    'Rectangle',
    '',
    '',
    '',
  ];

  final List<String> hints = [
    'All sides are of equal length and all angles are 90 degrees.',
    'Two sides are parallel and opposite sides are of equal length.',
    'Length of two adjacent sides is the same.',
    'Opposite sides are of equal lengths and all angles are 90 degrees.',
    'All sides are of equal length and all angles are 90 degrees.',
    '',
    '',
    '',
    '',
    '',
  ];

  final List<String> imagePath = [
    'assets/images/quadrilateral/quiz/qq1.jpg',
    'assets/images/quadrilateral/quiz/qq2.jpg',
    'assets/images/quadrilateral/quiz/qq3.jpg',
    'assets/images/quadrilateral/quiz/qq4.webp',
    'assets/images/quadrilateral/quiz/qq5.jpg',
    'assets/images/quadrilateral/quiz/qq6.jpg',
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
        title: Text('Quadrilateral Quiz'),
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
