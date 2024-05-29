// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'angleIntroductionPage.dart';
import 'anglePracticePage.dart';
import 'angleQuiz.dart';
import '../main.dart';

void main() {
  runApp(AnglesSections());
}

class AnglesSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sections Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AnglesSectionsPage(),
    );
  }
}

class AnglesSectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Angles Sections'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      BilingualMathGeoHomePage()), // Navigate back to PAGE2.dart
            ); // Navigate back when arrow is pressed
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SectionItem(
            title: 'LEARN',
            icon: Icons.book,
            color: Colors.green,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        AnglesIntroductionPage()), // Navigate to PAGE2.dart
              );
            },
          ),
          SectionItem(
            title: 'PRACTICE',
            icon: Icons.lightbulb,
            color: Colors.orange,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnglesPracticeQuiz()),
              );
            },
          ),
          SectionItem(
            title: 'QUIZ',
            icon: Icons.question_answer,
            color: Colors.blue,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AngleQuizApp()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionItem extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback onPressed;
  final IconData icon;

  const SectionItem({
    Key? key,
    required this.title,
    required this.color,
    required this.onPressed,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55.0, vertical: 30.0),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding:
                EdgeInsets.all(50.0), // Adjusted padding to make it smaller
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          icon: Icon(
            icon,
            size: 50.0,
          ),
          label: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz Page'),
      ),
      body: Center(
        child: const Text('Quiz Page Content'),
      ),
    );
  }
}

class LearnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Page'),
      ),
      body: Center(
        child: const Text('Learn Page Content'),
      ),
    );
  }
}

class PracticePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Page'),
      ),
      body: Center(
        child: const Text('Practice Page Content'),
      ),
    );
  }
}
