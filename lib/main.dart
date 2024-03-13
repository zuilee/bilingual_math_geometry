import 'package:bilingual_math_geometry/AnglePages/angleSectionPage.dart';
import 'package:bilingual_math_geometry/PlanesPages/planesSectionPage.dart';
import 'package:bilingual_math_geometry/QuadrilateralPages/quadrilateralSectionPage.dart';
import 'package:bilingual_math_geometry/TrianglePages/triangleSectionPage.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_application_1/PlanesPages/planesSectionPage.dart';
import 'LinesPages/linesSectionPage.dart';

void main() {
  runApp(BilingualMathGeo());
}

class BilingualMathGeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explora - Geometry',
      theme: ThemeData(
        primaryColor: Color(0xFFFBDAB),
      ),
      home: BilingualMathGeoHomePage(),
    );
  }
}

class BilingualMathGeoHomePage extends StatelessWidget {
  final int initialLives = 20;
  final int initialPoints = 0;
  final int totalLevels = 5; // Changed to 5 levels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Explora - Geometry')),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite),
                Text(
                  '$initialLives',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings page
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(totalLevels, (index){
            //itemCount: totalLevels;
            //itemBuilder: (context, index) {
              int levelNumber = index + 1;
              return GestureDetector(
                onTap: () {
                  // Check if the shape is "Lines"
                  if (_getShapeForLevel(levelNumber) == 'Lines') {
                    // Navigate to PAGE2.dart if it's "Lines"
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LinesSectionsPage()), // Navigate to PAGE2.dart
                    );
                  }
                  else if (_getShapeForLevel(levelNumber) == 'Planes') {
                      // Navigate to PAGE2.dart if it's "Planes"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PlanesSectionsPage()), // Navigate to PAGE2.dart
                      );
                  }
                  else if (_getShapeForLevel(levelNumber) == 'Triangle') {
                      // Navigate to PAGE2.dart if it's "Planes"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TriangleSectionsPage()), // Navigate to PAGE2.dart
                      );
                  }
                  else if (_getShapeForLevel(levelNumber) == 'Angles') {
                      // Navigate to PAGE2.dart if it's "Planes"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AnglesSectionsPage()), // Navigate to PAGE2.dart
                      );
                  }
                  else if (_getShapeForLevel(levelNumber) == 'Quadrilateral') {
                      // Navigate to PAGE2.dart if it's "Planes"
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => QuadrilateralSectionsPage()), // Navigate to PAGE2.dart
                      );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _getColorForLevel(levelNumber),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Center(
                          child : Text(
                            _getShapeForLevel(levelNumber),
                            style: TextStyle(fontSize: 20.0, color: Colors.white, ),
                          ),
                        ),
                      ),
                    )
                  ),
                )
              );
            //};
          })
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 2, 3, 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: Icon(Icons.map),
              color: Colors.white,
              onPressed: () {
                // Navigate to map page
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getColorForLevel(int levelNumber) {
    // Return a different color for each level
    switch (levelNumber) {
      case 1:
        return Colors.red; // Lines
      case 2:
        return Colors.blue; // Planes
      case 3:
        return Colors.green; // Angles
      case 4:
        return Color.fromARGB(208, 63, 10, 10); // Triangle
      case 5:
        return Colors.purple; // Quadrilateral
      default:
        return Colors.grey;
    }
  }

  String _getShapeForLevel(int levelNumber) {
    // Return a different shape name for each level
    switch (levelNumber) {
      case 1:
        return 'Lines';
      case 2:
        return 'Planes';
      case 3:
        return 'Angles';
      case 4:
        return 'Triangle';
      case 5:
        return 'Quadrilateral';
      default:
        return '';
    }
  }
}

class LevelPage extends StatelessWidget {
  final int levelNumber;

  LevelPage(this.levelNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level $levelNumber'),
      ),
      body: Center(
        child: Text(
          'This is Level $levelNumber',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}