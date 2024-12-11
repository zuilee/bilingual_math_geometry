import 'package:flutter/material.dart';
import 'planesSectionPage.dart';
import 'dart:math';

void main() {
  runApp(PlanesPracticeQuiz());
}

class PlanesPracticeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planes Practice',
      debugShowCheckedModeBanner: false,
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with TickerProviderStateMixin {
  int _score = 0;
  int _questionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'What is a plane?',
      'answers': [
        {'text': 'A flat, two-dimensional surface', 'correct': true},
        {'text': 'A three-dimensional shape', 'correct': false},
        {'text': 'A curved surface', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'What is a horizontal plane?',
      'answers': [
        {'text': 'A plane parallel to the horizon', 'correct': true},
        {'text': 'A plane perpendicular to the horizon', 'correct': false},
        {'text': 'A slanted plane', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'What is a vertical plane?',
      'answers': [
        {'text': 'A plane parallel to the horizon', 'correct': false},
        {'text': 'A plane perpendicular to the horizon', 'correct': true},
        {'text': 'A slanted plane', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'Which of the following best describes an inclined plane?',
      'answers': [
        {'text': 'A plane that curves upward', 'correct': false},
        {'text': 'A flat surface at an angle to the ground', 'correct': true},
        {'text': 'A flat surface parallel to the ground', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'Which of these is an example of a horizontal plane in real life?',
      'answers': [
        {'text': 'A wall', 'correct': false},
        {'text': 'The surface of a table', 'correct': true},
        {'text': 'A ramp', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'True or False: A vertical plane is always parallel to the ground.',
      'answers': [
        {'text': 'True', 'correct': false},
        {'text': 'False', 'correct': true},
      ],
      'questionImage': '',
    },
    {
      'question': 'What are the types of planes?',
      'answers': [
        {'text': 'Horizontal, vertical, inclined', 'correct': true},
        {'text': 'Acute, obtuse, right', 'correct': false},
        {'text': 'None of the above', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'What angle does a vertical plane typically make with the ground?',
      'answers': [
        {'text': '45 degrees', 'correct': false},
        {'text': '90 degrees', 'correct': true},
        {'text': '180 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'Which of the following angles would an inclined plane make with the ground?',
      'answers': [
        {'text': '45 degrees', 'correct': true},
        {'text': '90 degrees', 'correct': false},
        {'text': '0 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'What angle does a horizontal plane typically make with the ground?',
      'answers': [
        {'text': '45 degrees', 'correct': false},
        {'text': '90 degrees', 'correct': false},
        {'text': '0 degrees', 'correct': true},
      ],
      'questionImage': '',
    },
  ];

  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _answerQuestion(bool isCorrect) {
    if (isCorrect) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      _questionIndex++;
      _isFlipped = false;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _questionIndex = 0;
      _isFlipped = false;
    });
  }

  void _flipCard() {
    if (_isFlipped) {
      _controller.reverse();
    } else {
      _controller.forward();
    }
    _isFlipped = !_isFlipped;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Planes Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PlanesSectionsPage()), // Navigate back to PAGE2.dart
            ); // Navigate back when arrow is pressed
          },
        ),
      ),
      body: _questionIndex < _questions.length
          ? Center(
              child: AnimatedBuilder(
                animation: _animation,
                builder: (context, child) {
                  return Transform(
                    transform: Matrix4.identity()
                      ..setEntry(3, 2, 0.001)
                      ..rotateY(_animation.value * 3.14),
                    alignment: Alignment.center,
                    child: _buildFlipCard(),
                  );
                },
              ),
            )
          : CelebrationScreen(
              score: _score,
              totalQuestions: _questions.length,
              onRestart: _resetQuiz,
            ),
    );
  }

  Widget _buildFlipCard() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.height * 0.6,
      child: Card(
        elevation: 8.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: _isFlipped
            ? Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(pi),
                child: _buildAnswerCard(),
              )
            : Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(0),
                child: _buildQuestionCard(),
              ),
      ),
    );
  }

  // Widget _buildQuestionCard() {
  //   return Padding(
  //     padding: const EdgeInsets.all(16.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       children: [
  //         Expanded(
  //           child: Text(
  //             _questions[_questionIndex]['question'],
  //             style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
  //             textAlign: TextAlign.center,
  //           ),
  //         ),
  //         SizedBox(height: 20.0),
  //         Expanded(
  //           child: ListView.separated(
  //             shrinkWrap: true,
  //             itemCount: _questions[_questionIndex]['answers'].length,
  //             separatorBuilder: (context, index) => SizedBox(height: 10.0),
  //             itemBuilder: (context, index) {
  //               final answer = (_questions[_questionIndex]['answers']
  //                   as List<Map<String, dynamic>>)[index];
  //               return ElevatedButton(
  //                 onPressed: () => _answerQuestion(answer['correct']),
  //                 style: ElevatedButton.styleFrom(
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(8.0),
  //                   ),
  //                   padding: EdgeInsets.symmetric(vertical: 16.0),
  //                 ),
  //                 child: Text(
  //                   answer['text'],
  //                   style: TextStyle(fontSize: 18.0),
  //                   textAlign: TextAlign.center,
  //                 ),
  //               );
  //             },
  //           ),
  //         ),
  //         SizedBox(height: 20.0),
  //         IconButton(
  //           onPressed: _flipCard,
  //           icon: Icon(Icons.flip),
  //           style: IconButton.styleFrom(
  //             shape: CircleBorder(),
  //             padding: EdgeInsets.all(16.0),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildQuestionCard() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image handling: make it bigger and center it
          _questions[_questionIndex]['questionImage'] != ''
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(
                    _questions[_questionIndex]['questionImage'],
                    height: 350.0, // Increased image height
                    width: double.infinity, // Set width to match screen
                    fit: BoxFit.contain, // Ensure proper image scaling
                  ),
                )
              : const SizedBox.shrink(),

          // Question Text: Properly aligned and spaced
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              _questions[_questionIndex]['question'],
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),

          // Answers list with button spacing
          ListView.separated(
            shrinkWrap: true,
            itemCount: _questions[_questionIndex]['answers'].length,
            separatorBuilder: (context, index) => SizedBox(height: 10.0),
            itemBuilder: (context, index) {
              final answer = (_questions[_questionIndex]['answers']
                  as List<Map<String, dynamic>>)[index];
              return ElevatedButton(
                onPressed: () => _answerQuestion(answer['correct']),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  answer['text'],
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),

          // Flip icon button with spacing
          SizedBox(height: 20.0),
          IconButton(
            onPressed: _flipCard,
            icon: Icon(Icons.flip),
            style: IconButton.styleFrom(
              shape: CircleBorder(),
              padding: EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard() {
    List<Map<String, dynamic>> answers =
        _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>;
    String correctAnswer =
        answers.firstWhere((answer) => answer['correct'])['text'];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_questionIndex == 0)
                  Image.asset(
                    'assets/images/plane/plane.png',
                    width: 250,
                    height: 250,
                  ),
                if (_questionIndex == 1)
                  Image.asset(
                    'assets/images/plane/horizontal_plane.png',
                    width: 300,
                    height: 200,
                  ),
                if (_questionIndex == 2)
                  Image.asset(
                    'assets/images/plane/verticle_plane.png',
                    width: 500,
                    height: 300,
                  ),
                SizedBox(height: 20.0),
                Text(
                  'Correct Answer:',
                  style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.0),
                Text(
                  correctAnswer,
                  style: TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFlipped = false;
                  });
                  _controller.reverse();
                },
                icon: Icon(Icons.arrow_back),
                style: IconButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isFlipped = false;
                    _questionIndex++;
                  });
                  _controller.reverse();
                },
                icon: Icon(Icons.arrow_forward),
                style: IconButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CelebrationScreen extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final VoidCallback onRestart;

  CelebrationScreen({
    required this.score,
    required this.totalQuestions,
    required this.onRestart,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Congratulations!',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Text(
            'Your Score: $score/$totalQuestions',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 40.0),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow.withOpacity(0.8),
            ),
            child: Center(
              child: Text(
                '🎉',
                style: TextStyle(fontSize: 120.0),
              ),
            ),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
            onPressed: onRestart,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            ),
            child: Text(
              'Restart Quiz',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
