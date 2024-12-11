// ignore_for_file: file_names, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'quadrilateralIntroductionPage.dart';
import 'quadrilateralPracticePage.dart';
import 'quadrilateralQuiz.dart';
import '../main.dart';

void main() {
  runApp(QuadrilateralSections());
}

class QuadrilateralSections extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sections Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuadrilateralSectionsPage(),
    );
  }
}

class QuadrilateralSectionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quadrilateral Sections'),
        backgroundColor: Color.fromARGB(90, 102, 54, 51),
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
            title: 'Learn',
            icon: Icons.book,
            color: Color.fromARGB(255, 106, 188, 147),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        QuadrilateralIntroductionPage()), // Navigate to PAGE2.dart
              );
            },
          ),
          SectionItem(
            title: 'Practice',
            icon: Icons.lightbulb,
            color: Color.fromARGB(255, 215, 134, 80),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => QuadrilateralPracticeQuiz()),
              );
            },
          ),
          SectionItem(
            title: 'Quiz',
            icon: Icons.question_answer,
            color: Color.fromARGB(200, 109, 143, 201),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => QuadrilateralQuizApp()),
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
