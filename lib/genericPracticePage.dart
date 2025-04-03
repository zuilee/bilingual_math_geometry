import 'package:flutter/material.dart';
import 'dart:math';
import 'shapes_data.dart';
import '../sections.dart';

class GenericPracticePage extends StatefulWidget {
  final String shapeName;
  const GenericPracticePage({super.key, required this.shapeName});

  @override
  _GenericPracticePageState createState() => _GenericPracticePageState();
}

class _GenericPracticePageState extends State<GenericPracticePage>
    with TickerProviderStateMixin {
  int _score = 0;
  int _questionIndex = 0;
  late List<Map<String, dynamic>> _questions;
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isFlipped = false;

  // Retrieve the shape's data and practice info from shapes_data.dart
  Map<String, dynamic> get shapeData =>
      shapes.firstWhere((element) => element['name'] == widget.shapeName);
  Map<String, dynamic> get practiceData => shapeData['practice'];

  @override
  void initState() {
    super.initState();
    _questions =
        List<Map<String, dynamic>>.from(practiceData['questions'] as List);
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
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

  Widget _buildQuestionCard() {
    final currentQuestion = _questions[_questionIndex];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Display the question image if available.
          currentQuestion['questionImage'] != ''
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Image.asset(
                    currentQuestion['questionImage'],
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                )
              : const SizedBox.shrink(),
          // Display the question text.
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              currentQuestion['question'],
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          // List of answer buttons.
          ListView.separated(
            shrinkWrap: true,
            itemCount: (currentQuestion['answers'] as List).length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 10.0),
            itemBuilder: (context, index) {
              final answer = (currentQuestion['answers'] as List)[index];
              return ElevatedButton(
                onPressed: () => _answerQuestion(answer['correct']),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                ),
                child: Text(
                  answer['text'],
                  style: const TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          // Flip button to show the answer/hint.
          IconButton(
            onPressed: _flipCard,
            icon: const Icon(Icons.flip),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnswerCard() {
    final currentQuestion = _questions[_questionIndex];
    final answers = currentQuestion['answers'] as List;
    final correctAnswer =
        answers.firstWhere((answer) => answer['correct'] == true)['text'];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Optionally, display an answer image if your data includes an 'answerImage' key.
          currentQuestion.containsKey('answerImage') &&
                  currentQuestion['answerImage'] != ''
              ? Image.asset(
                  currentQuestion['answerImage'],
                  width: 250,
                  height: 250,
                  fit: BoxFit.contain,
                )
              : const SizedBox.shrink(),
          const SizedBox(height: 20.0),
          const Text(
            'Correct Answer:',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10.0),
          Text(
            correctAnswer,
            style: const TextStyle(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20.0),
          // Flip button to go back to the question card.
          IconButton(
            onPressed: _flipCard,
            icon: const Icon(Icons.flip),
            style: IconButton.styleFrom(
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(16.0),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Quiz Completed!',
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Your Score: $_score/${_questions.length}',
            style: const TextStyle(fontSize: 18.0),
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: _resetQuiz,
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.shapeName} Practice'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SectionsPage(
                  title: widget.shapeName,
                  sectionItems:
                      List<Map<String, dynamic>>.from(shapeData['section']),
                ),
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
                      ..rotateY(_animation.value * pi),
                    alignment: Alignment.center,
                    child: _buildFlipCard(),
                  );
                },
              ),
            )
          : _buildResultScreen(),
    );
  }
}
