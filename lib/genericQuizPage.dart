import 'package:flutter/material.dart';
import 'shapes_data.dart';
import 'theme_state.dart';

class GenericQuizPage extends StatefulWidget {
  final String shapeName;
  const GenericQuizPage({Key? key, required this.shapeName}) : super(key: key);

  @override
  _GenericQuizPageState createState() => _GenericQuizPageState();
}

class _GenericQuizPageState extends State<GenericQuizPage> {
  late List<Map<String, dynamic>> _questions;
  int currentQuestionIndex = 0;
  int attemptsLeft = 2;
  String? selectedOption;
  int score = 0;

  Map<String, dynamic> get shapeData =>
      shapes.firstWhere((element) => element['name'] == widget.shapeName);

  Color _getThemeColor(bool isDark) {
    return isDark ? shapeData['darkcolor'] : shapeData['color'];
  }

  @override
  void initState() {
    super.initState();
    _questions = List<Map<String, dynamic>>.from(shapeData['quiz']['questions']);
  }

  void showHint(bool isDark) {
    final hint = _questions[currentQuestionIndex]['hint'] ?? '';
    if (hint.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: isDark ? const Color(0xFF171717) : null,
            title: Text('Hint', style: TextStyle(color: isDark ? Colors.white : Colors.black)),
            content: Text(hint, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
            actions: [
              TextButton(
                style: TextButton.styleFrom(foregroundColor: isDark ? Colors.white : Colors.black),
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void checkAnswer(bool isDark) {
    if (selectedOption != null &&
        selectedOption == _questions[currentQuestionIndex]['correctAnswer']) {
      setState(() {
        score += 5;
      });
      _showDialog('Correct!', 'Well done!', isDark, true);
    } else {
      setState(() {
        score -= 1;
        attemptsLeft--;
      });

      if (attemptsLeft <= 0) {
        _showDialog(
          'Incorrect',
          'You have used all attempts.\nThe correct answer is:\n\n${_questions[currentQuestionIndex]['correctAnswer']}',
          isDark,
          true,
        );
      } else {
        _showDialog(
          'Incorrect',
          'Try again. You have $attemptsLeft attempt left.',
          isDark,
          false,
        );
      }
    }
  }

  void _showDialog(String title, String content, bool isDark, bool moveNext) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? const Color(0xFF171717) : null,
        title: Text(title, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        content: Text(content, style: TextStyle(color: isDark ? Colors.white : Colors.black)),
        actions: [
          TextButton(
            style: TextButton.styleFrom(foregroundColor: isDark ? Colors.white : Colors.black),
            onPressed: () {
              Navigator.of(context).pop();
              if (moveNext) nextQuestion();
            },
            child: Text(moveNext ? 'Next' : 'OK'),
          ),
        ],
      ),
    );
  }

  void nextQuestion() {
    if (currentQuestionIndex < _questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
        attemptsLeft = 2;
        selectedOption = null;
      });
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: themeModel.isDarkMode ? const Color(0xFF171717) : null,
            title: Text(
              'Quiz Finished!',
              style: TextStyle(color: themeModel.isDarkMode ? Colors.white : Colors.black),
            ),
            content: Text(
              'Congratulations! You completed the quiz. Your score is $score.',
              style: TextStyle(color: themeModel.isDarkMode ? Colors.white : Colors.black),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: themeModel.isDarkMode ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
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
    return AnimatedBuilder(
      animation: themeModel,
      builder: (context, _) {
        bool isDark = themeModel.isDarkMode;
        final Color themeColor = _getThemeColor(isDark);
        final currentQuestion = _questions[currentQuestionIndex];
        final media = MediaQuery.of(context);

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(67.2),
            child: Container(
              color: themeColor,
              child: SafeArea(
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          '${widget.shapeName} Quiz',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            'Score: $score',
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            isDark ? Icons.nightlight_round : Icons.wb_sunny,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            themeModel.toggleTheme();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Container(
            color: isDark ? const Color(0xFF212121) : Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 600,
                  maxHeight: media.size.height * 0.85,
                ),
                child: Card(
                  elevation: 8.0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                  color: isDark ? const Color(0xFF171717) : Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          physics: constraints.maxHeight < 600
                              ? const BouncingScrollPhysics()
                              : const NeverScrollableScrollPhysics(),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              if (currentQuestion['questionImage'] != '')
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 16.0),
                                  child: Image.asset(
                                    currentQuestion['questionImage'],
                                    height: constraints.maxHeight * 0.38,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              Text(
                                currentQuestion['question'],
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: isDark ? Colors.white : themeColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 16.0),
                              ...List<Widget>.from(
                                (currentQuestion['options'] as List).map(
                                  (option) => RadioListTile<String>(
                                    title: Text(
                                      option,
                                      style: TextStyle(color: isDark ? Colors.white : themeColor),
                                    ),
                                    value: option,
                                    groupValue: selectedOption,
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedOption = value;
                                      });
                                    },
                                    activeColor: themeColor,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              TextButton(
                                onPressed: () => showHint(isDark),
                                child: Text(
                                  'Hint',
                                  style: TextStyle(color: isDark ? Colors.white : themeColor),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              ElevatedButton(
                                onPressed: () => checkAnswer(isDark),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: themeColor,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                child: const Text('Submit'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
