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
    'A construction worker is building a ramp for a wheelchair. The ramp is inclined at a 12° angle with the ground. What type of plane does the ramp represent?',
    'When an airplane takes off, it travels along a runway that is essentially a large flat surface. What type of plane is the runway considered to be?',
    'A large sliding door in a building is mounted vertically and opens by sliding along the wall. What type of plane is the sliding door mounted on?',
    'A skier is descending a snow-covered slope. The slope forms an angle of 30° with the horizontal. What type of plane is the slope of the hill considered to be?',
    'A shelf in your house is mounted on the wall. The surface of the shelf is parallel to the ground. What type of plane is the shelf considered to be?',
    'In a science experiment, a student places a book on an inclined surface that forms a 15° angle with the floor. What type of plane does the inclined surface represent?',
    'A photographer uses a vertical backdrop for a photo shoot, ensuring it is perfectly upright. What type of plane is the backdrop placed on?',
    'A diver jumps from a diving board that extends horizontally over a pool. Which type of plane does the diving board represent?',
    'A car is parked on a road that is tilted to help rainwater drain. The slope of the road is at a 5° incline. What type of plane is the surface of the road considered to be?',
    'In a factory, workers assemble parts on a conveyor belt. The conveyor belt is tilted slightly to move items. What type of plane does the surface of the conveyor belt represent?',
  ];

  final List<List<String>> options = [
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane'],
    ['Horizontal plane', 'Vertical plane', 'Inclined plane']
  ];

  final List<String> answers = [
    'Inclined plane',
    'Horizontal plane',
    'Vertical plane',
    'Inclined plane',
    'Horizontal plane',
    'Inclined plane',
    'Vertical plane',
    'Horizontal plane',
    'Inclined plane',
    'Inclined plane'
  ];

  final List<String> hints = [];

  final List<String> imagePath = [
    'assets/images/plane/quiz/pq1.jpg',
    'assets/images/plane/quiz/pq2.jpg',
    'assets/images/plane/quiz/pq3.jpg',
    'assets/images/plane/quiz/pq4.jpg',
    'assets/images/plane/quiz/pq5.jpg',
    'assets/images/plane/quiz/pq6.jpg',
    'assets/images/plane/quiz/pq7.jpg',
    'assets/images/plane/quiz/pq8.jpg',
    'assets/images/plane/quiz/pq9.webp',
    'assets/images/plane/quiz/pq10.jpg',
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
        title: Text('Plane Quiz'),
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
