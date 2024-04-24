import 'package:flutter/material.dart';
import 'quadrilateralSectionPage.dart';

void main() {
  runApp(QuadrilateralPracticeQuiz());
}

class QuadrilateralPracticeQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quadrilateral Quiz',
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
      'question': 'What is a square?',
      'answers': [
        {'text': 'A quadrilateral with four right angles', 'correct': true},
        {
          'text': 'A quadrilateral with all sides of equal length',
          'correct': true
        },
        {'text': 'A quadrilateral with no right angles', 'correct': false},
      ],
    },
    {
      'question': 'What is a rectangle?',
      'answers': [
        {'text': 'A quadrilateral with four right angles', 'correct': true},
        {
          'text': 'A quadrilateral with all sides of equal length',
          'correct': false
        },
        {'text': 'A quadrilateral with no right angles', 'correct': false},
      ],
    },
    {
      'question': 'What is a parallelogram?',
      'answers': [
        {'text': 'A quadrilateral with four right angles', 'correct': false},
        {
          'text': 'A quadrilateral with all sides of equal length',
          'correct': false
        },
        {
          'text': 'A quadrilateral with opposite sides parallel',
          'correct': true
        },
      ],
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
        title: Text('Quadrilateral Quiz'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => QuadrilateralSectionsPage(),
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
                    child:
                        _isFlipped ? _buildAnswerCard() : _buildQuestionCard(),
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

  Widget _buildQuestionCard() {
    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              _questions[_questionIndex]['question'],
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ...(_questions[_questionIndex]['answers']
                    as List<Map<String, dynamic>>)
                .map((answer) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: ElevatedButton(
                  onPressed: () => _answerQuestion(answer['correct']),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                  ),
                  child: Text(
                    answer['text'],
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),
              );
            }).toList(),
            SizedBox(height: 20.0),
            ElevatedButton.icon(
              onPressed: _flipCard,
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              icon: Icon(Icons.flip),
              label: Text('Flip'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerCard() {
    List<Map<String, dynamic>> answers =
        _questions[_questionIndex]['answers'] as List<Map<String, dynamic>>;
    String correctAnswer =
        answers.firstWhere((answer) => answer['correct'])['text'];

    return Card(
      elevation: 8.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Correct Answer:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Text(
              correctAnswer,
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isFlipped = false;
                  _questionIndex++;
                });
                _controller.reverse();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(vertical: 12.0),
              ),
              child: Text('Next'),
            ),
          ],
        ),
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