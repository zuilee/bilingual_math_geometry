import 'package:flutter/material.dart';
import 'angleSectionPage.dart';
import 'dart:math';

void main() {
  runApp(AnglesPracticeQuiz());
}

class AnglesPracticeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angles Practice',
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
      'question': 'What is the measure of a right angle?',
      'answers': [
        {'text': '90 degrees', 'correct': true},
        {'text': '45 degrees', 'correct': false},
        {'text': '120 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'What is the measure of an acute angle?',
      'answers': [
        {'text': 'Less than 90 degrees', 'correct': true},
        {'text': 'Exactly 90 degrees', 'correct': false},
        {'text': 'More than 90 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'What type of angle is this?',
      'answers': [
        {'text': 'Reflex Angle', 'correct': true},
        {'text': 'Acute Angle', 'correct': false},
        {'text': 'Straight Angle', 'correct': false},
      ],
      'questionImage': 'assets/images/angles/Reflex_Angle.png',
    },
    {
      'question': 'What is the measure of an obtuse angle?',
      'answers': [
        {'text': 'More than 90 degrees', 'correct': true},
        {'text': 'Exactly 90 degrees', 'correct': false},
        {'text': 'Less than 90 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question':
          'Which of the following lists correctly classifies the angles in order?',
      'answers': [
        {'text': 'Acute, Right, Reflex, Obtuse', 'correct': true},
        {'text': 'Acute, Right, Obtuse, Reflex', 'correct': false},
        {'text': 'Right, Acute, Obtuse, Reflex', 'correct': false},
      ],
      'questionImage': 'assets/images/angles/4.png',
    },
    {
      'question': 'Identify Obtuse Angle',
      'answers': [
        {'text': 'A', 'correct': false},
        {'text': 'B', 'correct': false},
        {'text': 'C', 'correct': true},
      ],
      'questionImage': 'assets/images/angles/3.png',
    },
    {
      'question': 'Identify Reflex Angle',
      'answers': [
        {'text': 'A', 'correct': false},
        {'text': 'B', 'correct': true},
        {'text': 'C', 'correct': false},
      ],
      'questionImage': 'assets/images/angles/3.png',
    },
    {
      'question':
          'Which of the following could be the measure of an reflex angle?',
      'answers': [
        {'text': '90 degrees', 'correct': false},
        {'text': '45 degrees', 'correct': false},
        {'text': '220 degrees', 'correct': true},
      ],
      'questionImage': '',
    },
    {
      'question': 'What is the measure of a straight angle?',
      'answers': [
        {'text': '90 degrees', 'correct': false},
        {'text': '180 degrees', 'correct': true},
        {'text': '360 degrees', 'correct': false},
      ],
      'questionImage': '',
    },
    {
      'question': 'What is the measure of a full rotation angle?',
      'answers': [
        {'text': '90 degrees', 'correct': false},
        {'text': '45 degrees', 'correct': false},
        {'text': '360 degrees', 'correct': true},
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
        title: Text('Angles Practice'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => AnglesSectionsPage(),
              ),
            );
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
      height: MediaQuery.of(context).size.height * 0.8,
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
  //           child: _questions[_questionIndex]['questionImage'] != ''
  //               ? Image.asset(
  //                   _questions[_questionIndex]
  //                       ['questionImage'], // Replace with your asset path
  //                   height: 400,
  //                   width: 200.0,
  //                   //fit: BoxFit.contain,
  //                 )
  //               : const SizedBox.shrink(),
  //         ),
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
                    'assets/images/angles/right.png',
                    width: 250,
                    height: 250,
                  ),
                if (_questionIndex == 1)
                  Image.asset(
                    'assets/images/angles/acute.png',
                    width: 200,
                    height: 200,
                  ),
                if (_questionIndex == 2)
                  Image.asset(
                    'assets/images/angles/obtuse.png',
                    width: 200,
                    height: 200,
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
