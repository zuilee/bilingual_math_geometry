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
  int attemptsLeft = 3;
  String? selectedOption;
  int score = 0;

  @override
  void initState() {
    super.initState();
    final shapeData =
        shapes.firstWhere((element) => element['name'] == widget.shapeName);
    _questions =
        List<Map<String, dynamic>>.from(shapeData['quiz']['questions']);
  }

  void showHint(bool isDark) {
    final hint = _questions[currentQuestionIndex]['hint'] ?? '';
    if (hint.isNotEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: isDark ? const Color(0xFF171717) : null,
            title: Text(
              'Hint',
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            content: Text(
              hint,
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : Colors.black,
                ),
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
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: isDark ? const Color(0xFF171717) : null,
            title: Text(
              'Correct!',
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            content: Text(
              'Well done!',
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  nextQuestion(isDark);
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
              backgroundColor: isDark ? const Color(0xFF171717) : null,
              title: Text(
                'Incorrect',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              content: Text(
                'You have no attempts left. The correct answer is:\n\n${_questions[currentQuestionIndex]['correctAnswer']}',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: isDark ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                    nextQuestion(isDark);
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
              backgroundColor: isDark ? const Color(0xFF171717) : null,
              title: Text(
                'Incorrect',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              content: Text(
                'Try again. You have $attemptsLeft attempts left.',
                style: TextStyle(color: isDark ? Colors.white : Colors.black),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    foregroundColor: isDark ? Colors.white : Colors.black,
                  ),
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

  void nextQuestion(bool isDark) {
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
            backgroundColor: isDark ? const Color(0xFF171717) : null,
            title: Text(
              'Quiz Finished!',
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            content: Text(
              'Congratulations! You completed the quiz. Your score is $score.',
              style: TextStyle(color: isDark ? Colors.white : Colors.black),
            ),
            actions: [
              TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).pop(); // Go back to Sections.
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
        final currentQuestion = _questions[currentQuestionIndex];

        return Scaffold(
          // AppBar styling for dark/light mode
          appBar: AppBar(
            backgroundColor: isDark ? const Color(0xFF171717) : Colors.white,
            iconTheme: IconThemeData(
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              '${widget.shapeName} Quiz',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Text(
                    'Score: $score',
                    style: TextStyle(
                      fontSize: 18.0,
                      color: isDark ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
              // Dark mode toggle button.
              IconButton(
                icon: Icon(
                  isDark ? Icons.nightlight_round : Icons.wb_sunny,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  themeModel.toggleTheme();
                },
              ),
            ],
          ),
          // Fill the screen & allow scrolling if needed.
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Container(
                    color: isDark ? const Color(0xFF212121) : Colors.white,
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (currentQuestion['questionImage'] != '')
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                            child: Image.asset(
                              currentQuestion['questionImage'],
                              height: 350.0,
                              width: double.infinity,
                              fit: BoxFit.contain,
                            ),
                          )
                        else
                          const SizedBox.shrink(),
                        const SizedBox(height: 10.0),
                        Text(
                          currentQuestion['question'],
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20.0),
                        // Options
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: (currentQuestion['options'] as List)
                              .map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(
                                option,
                                style: TextStyle(
                                  color: isDark ? Colors.white : Colors.black,
                                ),
                              ),
                              value: option,
                              groupValue: selectedOption,
                              onChanged: (String? value) {
                                setState(() {
                                  selectedOption = value;
                                });
                              },
                              activeColor: isDark ? Colors.white : Theme.of(context).primaryColor,
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 10.0),
                        TextButton(
                          onPressed: () => showHint(isDark),
                          child: Text(
                            'Hint',
                            style: TextStyle(
                              color: isDark ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                          onPressed: () => checkAnswer(isDark),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isDark
                                ? const Color(0xFF171717)
                                : Theme.of(context).primaryColor,
                            foregroundColor: Colors.white,
                          ),
                          child: const Text('Submit'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
