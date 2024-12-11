import 'package:bilingual_math_geometry/AnglePages/angleSectionPage.dart';
import 'package:bilingual_math_geometry/PlanesPages/planesSectionPage.dart';
import 'package:bilingual_math_geometry/QuadrilateralPages/quadrilateralSectionPage.dart';
import 'package:bilingual_math_geometry/TrianglePages/triangleSectionPage.dart';
import 'package:flutter/material.dart';
import 'LinesPages/linesSectionPage.dart';

void main() {
  runApp(const BilingualMathGeo());
}

class BilingualMathGeo extends StatelessWidget {
  const BilingualMathGeo({super.key});

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

  void showOptions(int levelNumber) {}
}

class BilingualMathGeoHomePage extends StatelessWidget {
  final int initialLives = 20;
  final int initialPoints = 0;
  final int totalLevels = 6; // Changed to 5 levels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Explora - Geometry')),
        backgroundColor: Color.fromARGB(90, 102, 54, 51),
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
      body: GridView.count(
          //child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,

          padding: const EdgeInsets.all(20),
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          children: List.generate(totalLevels, (index) {
            //itemCount: totalLevels;
            //itemBuilder: (context, index) {
            int levelNumber = index + 1;
            return GestureDetector(
                onTap: () {
                  // Check if the shape is "Lines"
                  if (_getShapeForLevel(levelNumber) == 'Lines') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              LinesSectionsPage()), // Navigate to PAGE2.dart
                    );
                    //showOptions(context);
                  } else if (_getShapeForLevel(levelNumber) == 'Planes') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              PlanesSectionsPage()), // Navigate to PAGE2.dart
                    );
                  } else if (_getShapeForLevel(levelNumber) == 'Triangle') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              TriangleSectionsPage()), // Navigate to PAGE2.dart
                    );
                  } else if (_getShapeForLevel(levelNumber) == 'Angles') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AnglesSectionsPage()), // Navigate to PAGE2.dart
                    );
                  } else if (_getShapeForLevel(levelNumber) ==
                      'Quadrilateral') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuadrilateralSectionsPage()), // Navigate to PAGE2.dart
                    );
                  } else if (_getShapeForLevel(levelNumber) == 'Circle') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              QuadrilateralSectionsPage()), // Navigate to PAGE2.dart
                    );
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Container(
                      height: 20,
                      width: 70,
                      decoration: BoxDecoration(
                        color: _getColorForLevel(levelNumber),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Center(
                            child: Text(
                              _getShapeForLevel(levelNumber),
                              style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                ));
            //};
          })
          //),
          ),
      // bottomNavigationBar: BottomAppBar(
      //   color: const Color.fromARGB(255, 2, 3, 2),
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       IconButton(
      //         icon: Icon(Icons.map),
      //         color: Colors.white,
      //         onPressed: () {
      //           // Navigate to map page
      //         },
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

  Color _getColorForLevel(int levelNumber) {
    // Return a different color for each level
    switch (levelNumber) {
      case 1:
        return Color.fromARGB(150, 81, 115, 157); // Lines
      case 2:
        return const Color.fromARGB(255, 106, 188, 147); // Planes
      case 3:
        return const Color.fromARGB(255, 215, 134, 80); // Angles
      case 4:
        return Color.fromARGB(208, 173, 76, 76); // Triangle
      case 5:
        return const Color.fromARGB(255, 169, 63, 97); // Quadrilateral
      case 6:
        return Color.fromARGB(255, 101, 95, 95);
      default:
        return const Color.fromARGB(255, 101, 95, 95);
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
      case 6:
        return 'Circle';
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

Widget showOptions(BuildContext context) {
  print("here");
  return Scaffold(
    body: Center(
      child: Column(
        children: [
          GestureDetector(
              onTap: () {
                // Navigate to PAGE2.dart if it's "Lines"
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          BilingualMathGeoHomePage()), // Navigate to PAGE2.dart
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Container(
                    height: 20,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Center(
                          child: Text(
                            "Juilee",
                            style: const TextStyle(
                                fontSize: 25.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )),
              ))
        ],
      ),
    ),
  );
}
