import 'package:flutter/material.dart';
import 'shapes_data.dart';
// import './sections.dart';

class GenericQuizPage extends StatefulWidget {
  final String shapeName;
  const GenericQuizPage({super.key, required this.shapeName});

  @override
  _GenericQuizPageState createState() => _GenericQuizPageState();
}

class _GenericQuizPageState extends State<GenericQuizPage> {
  late List<Map<String, dynamic>> _questions;
  int currentQuestionIndex = 0;
  int attemptsLeft = 3;
  String? selectedOption;
  int score = 0;

  @override
  void initState() {
    super.initState();
    final shapeData =
        shapes.firstWhere((element) => element['name'] == widget.shapeName);
    _questions = List<Map<String, dynamic>>.from(shapeData['quiz']['questions']);
  }

  void showHint() {
    final hint = _questions[currentQuestionIndex]['hint'] ?? '';
    if (hint.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Hint'),
            content: Text(hint),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer() {
    if (selectedOption != null &&
        selectedOption == _questions[currentQuestionIndex]['correctAnswer']) {
      setState(() {
        score += 5;
      });
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Correct!'),
            content: const Text('Well done!'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  nextQuestion();
                },
                child: const Text('Next'),
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
          builder: (context) {
            return AlertDialog(
              title: const Text('Incorrect'),
              content: Text(
                  'You have no attempts left. The correct answer is:\n\n${_questions[currentQuestionIndex]['correctAnswer']}'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    nextQuestion();
                  },
                  child: const Text('Next'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Incorrect'),
              content:
                  Text('Try again. You have $attemptsLeft attempts left.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < _questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        attemptsLeft = 3;
        selectedOption = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Quiz Finished!'),
            content:
                Text('Congratulations! You completed the quiz. Your score is $score.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to Sections
                },
                child: const Text('Back to Home'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.shapeName} Quiz'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child:
                  Text('Score: $score', style: const TextStyle(fontSize: 18.0)),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            currentQuestion['questionImage'] != ''
                ? Image.asset(
                    currentQuestion['questionImage'],
                    height: 350.0,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 10.0),
            Text(
              currentQuestion['question'],
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: (currentQuestion['options'] as List).map<Widget>((option) {
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
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: showHint,
              child: const Text('Hint'),
            ),
            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: checkAnswer,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
