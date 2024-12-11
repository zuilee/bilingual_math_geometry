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
    'A ladder is leaning against a wall, forming an angle of 60° with the ground. What type of angle is formed between the ladder and ground?',
    'The hands of a clock show 10:10, forming an angle of approximately 150° between them. What type of angle is this?',
    'A road sign shows a bend where the road turns sharply, forming a 90 degree angle. What type of angle does this represent?',
    'A seesaw is perfectly horizontal in its resting position. What angle is formed between the two sides?',
    'A ferris wheel completes one full rotation (360°). What type of angle does this represent?',
    'A car ramp is inclined at an angle of 120° with the ground. What type of angle does this represent?',
    'The sails of a windmill form angles as they rotate. If two adjacent sails form an angle of exactly 90°, what type of angle is this?',
    'A pizza slice has a pointed tip forming an angle of approximately 30°. What type of angle is at the tip?',
    'The pages of an open book form an angle of about 180° when laid flat on a table. What type of angle is formed at the spine of the book?',
    'A slice of a circular pie has an angle of 45° at its tip. What type of angle is represented at the tip of the slice?',
  ];

  final List<List<String>> options = [
    ['Acute Angle', 'Right Angle', 'Obtuse Angle'],
    ['Right Angle', 'Obtuse Angle', 'Reflex Angle'],
    ['Right Angle', 'Straight Angle', 'Acute Angle'],
    ['Straight Angle', 'Right Angle', 'Full Rotation Angle'],
    ['Reflex Angle', 'Full Rotation Angle', 'Straight Angle'],
    ['Obtuse Angle', 'Acute Angle', 'Reflex Angle'],
    ['Acute Angle', 'Right Angle ', 'Straight Angle'],
    ['Acute Angle', 'Right Angle', 'Obtuse Angle'],
    ['Straight Angle', 'Reflex Angle', 'Right Angle'],
    ['Acute Angle', 'Obtuse Angle', 'Right Angle']
  ];

  final List<String> answers = [
    'Acute Angle',
    'Obtuse Angle',
    'Right Angle',
    'Straight Angle',
    'Full Rotation Angle',
    'Obtuse Angle',
    'Right Angle ',
    'Acute Angle',
    'Straight Angle',
    'Acute Angle'
  ];

  final List<String> hints = [
    'The angle is less than 90 degrees.',
    'Angle formed is greater than 90 degrees but less than 180 degrees.',
    'Angle formed is exactly 90 degrees.',
    'Angled formed is exactly 180 degrees.',
    'Angle formed is exactly 360 degrees.',
    'Angle is greater than 90 degrees but less than 180 degrees.',
    'Angle formed is exactly 90 degrees.',
    'Angle formed is less than 90 degrees.',
    'Angled formed is exactly 180 degrees.',
    'Angle formed is less than 90 degrees.',
  ];

  final List<String> imagePath = [
    'assets/images/angles/quiz/aq1.jpg',
    'assets/images/angles/quiz/aq2.png',
    'assets/images/angles/quiz/aq3.jpg',
    'assets/images/angles/quiz/aq4.jpeg',
    'assets/images/angles/quiz/aq5.webp',
    'assets/images/angles/quiz/aq6.jpg',
    'assets/images/angles/quiz/aq7.jpg',
    'assets/images/angles/quiz/aq8.jpg',
    'assets/images/angles/quiz/aq9.jpg',
    'assets/images/angles/quiz/aq10.webp',
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
