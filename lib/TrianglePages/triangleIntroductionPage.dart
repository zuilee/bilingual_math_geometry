import 'package:flutter/material.dart';
import 'triangleSectionPage.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(TriangleIntroductionPage());
}

class TriangleIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Triangles',
      debugShowCheckedModeBanner: false,
      home: TriangleIntroductionGeometryPage(),
    );
  }
}

class TriangleIntroductionGeometryPage extends StatefulWidget {
  @override
  _TriangleIntroductionGeometryPageState createState() =>
      _TriangleIntroductionGeometryPageState();
}

class _TriangleIntroductionGeometryPageState
    extends State<TriangleIntroductionGeometryPage> {
  bool _isEnglish = true;

  FlutterTts flutterTts = FlutterTts();
  bool _isSpeaking = false;
  int _voiceButtonClickCount = 0;
  String _pageContent = '';

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  Future<void> _speak(String text) async {
    if (_isSpeaking) {
      await flutterTts.stop(); // Stop speaking if already speaking
      setState(() {
        _isSpeaking = false; // Set speaking state to false
        _voiceButtonClickCount = 0; // Reset button click count
      });
    } else {
      setState(() {
        _isSpeaking = true; // Set speaking state to true
      });
      await flutterTts.setLanguage(_isEnglish ? 'en-US' : 'es-ES');
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  @override
  void initState() {
    super.initState();
    _updatePageContent();
  }

  void _updatePageContent() {
    setState(() {
      _pageContent = _getPageContent();
    });
  }

  String _getPageContent() {
    var content = _isEnglish
        ? 'A triangle is a polygon with three edges and three vertices.'
        : 'Un triángulo es un polígono con tres lados y tres vértices.';
    content += _isEnglish ? 'Types of Triangles:' : 'Tipos de Triángulos:';
    content +=
        _isEnglish ? '1. Equilateral Triangle' : '1. Triángulo Equilátero';
    content += _isEnglish
        ? 'A triangle with all three sides of equal length.'
        : 'Un triángulo con todos los lados de igual longitud.';
    content += _isEnglish ? '2. Isosceles Triangle' : '2. Triángulo Isósceles';
    content += _isEnglish
        ? 'A triangle with at least two sides of equal length.'
        : 'Un triángulo con al menos dos lados de igual longitud.';
    content += _isEnglish ? '3.Scalene Triangle' : '3. Triángulo Escaleno';
    content += _isEnglish
        ? 'A triangle with all sides of different lengths.'
        : 'Un triángulo con todos los lados de longitudes diferentes.';
    content +=
        _isEnglish ? 'Types based on Angles:' : 'Tipos basados en Ángulos:';
    content += _isEnglish ? '4. Acute Triangle' : '4. Triángulo Acutángulo';
    content += _isEnglish
        ? 'A triangle in which all angles are acute (less than 90 degrees).'
        : 'Un triángulo en el que todos los ángulos son agudos (menores de 90 grados).';
    content += _isEnglish ? '5. Obtuse Triangle' : '5. Triángulo Obtusángulo';
    content += _isEnglish
        ? 'A triangle in which one angle is obtuse (greater than 90 degrees).'
        : 'Un triángulo en el que un ángulo es obtuso (mayor de 90 grados).';
    content += _isEnglish ? '6. Right Triangle' : '6. Triángulo Rectángulo';
    content += _isEnglish
        ? 'A triangle in which one angle is a right angle (90 degrees).'
        : 'Un triángulo en el que un ángulo es un ángulo recto (90 grados).';
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry: Triangles'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      TriangleSectionsPage()), // Navigate back to PAGE2.dart
            ); // Navigate back when arrow is pressed
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: _toggleLanguage,
          ),
          IconButton(
            icon: Icon(Icons.record_voice_over,
                color: _isSpeaking
                    ? Colors.blue
                    : null), // Change color when speaking
            onPressed: () {
              setState(() {
                _voiceButtonClickCount++;
              });
              if (_voiceButtonClickCount == 1) {
                _speak(_pageContent);
              } else if (_voiceButtonClickCount == 2) {
                _speak('');
              }
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white60, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _isEnglish
                    ? Image.asset(
                        'assets/images/triangles/Triangle_E.png', // Replace with your asset path
                        height: 400.0,
                        width: 250.0,
                        fit: BoxFit.contain,
                      )
                    : Image.asset(
                        'assets/images/triangles/Triangle_S.png', // Replace with your asset path
                        height: 400.0,
                        width: 250.0,
                        fit: BoxFit.contain,
                      ),
                SizedBox(height: 20.0),
                _buildTriangleDefinition(_isEnglish),
                SizedBox(height: 20.0),
                _buildTriangleTypes(_isEnglish),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTriangleDiagram() {
    return SizedBox(
      height: 100.0,
      child: CustomPaint(
        painter: TrianglePainter(),
      ),
    );
  }

  Widget _buildTriangleDefinition(bool isEnglish) {
    return Text(
      isEnglish
          ? 'A triangle is a polygon with three edges and three vertices.'
          : 'Un triángulo es un polígono con tres lados y tres vértices.',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildTriangleTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Triangles:' : 'Tipos de Triángulos:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildTriangleTypeItem(
            isEnglish ? '1. Equilateral Triangle' : '1. Triángulo Equilátero',
            isEnglish
                ? 'A triangle with all three sides of equal length.'
                : 'Un triángulo con todos los lados de igual longitud.',
            isEnglish
                ? 'assets/images/triangles/Equilateral_E.png'
                : 'assets/images/triangles/Equilateral_S.png'),
        _buildTriangleTypeItem(
            isEnglish ? '2. Isosceles Triangle' : '2. Triángulo Isósceles',
            isEnglish
                ? 'A triangle with at least two sides of equal length.'
                : 'Un triángulo con al menos dos lados de igual longitud.',
            isEnglish
                ? 'assets/images/triangles/Isoceles_E.png'
                : 'assets/images/triangles/Isoceles_S.png'),
        _buildTriangleTypeItem(
            isEnglish ? '3. Scalene Triangle' : '3. Triángulo Escaleno',
            isEnglish
                ? 'A triangle with all sides of different lengths.'
                : 'Un triángulo con todos los lados de longitudes diferentes.',
            isEnglish
                ? 'assets/images/triangles/Scalene_E.png'
                : 'assets/images/triangles/Scalene_S.png'),
        SizedBox(height: 10.0),
        Text(
          isEnglish ? 'Types based on Angles:' : 'Tipos basados en Ángulos:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildTriangleTypeItem(
            isEnglish ? '4. Acute Triangle' : '4. Triángulo Acutángulo',
            isEnglish
                ? 'A triangle in which all angles are acute (less than 90 degrees).'
                : 'Un triángulo en el que todos los ángulos son agudos (menores de 90 grados).',
            isEnglish
                ? 'assets/images/triangles/Acute_E.png'
                : 'assets/images/triangles/Acute_S.png'),
        _buildTriangleTypeItem(
            isEnglish ? '5. Obtuse Triangle' : '5. Triángulo Obtusángulo',
            isEnglish
                ? 'A triangle in which one angle is obtuse (greater than 90 degrees).'
                : 'Un triángulo en el que un ángulo es obtuso (mayor de 90 grados).',
            isEnglish
                ? 'assets/images/triangles/Obtuse_E.png'
                : 'assets/images/triangles/Obtuse_S.png'),
        _buildTriangleTypeItem(
            isEnglish ? '6. Right Triangle' : '6. Triángulo Rectángulo',
            isEnglish
                ? 'A triangle in which one angle is a right angle (90 degrees).'
                : 'Un triángulo en el que un ángulo es un ángulo recto (90 grados).',
            isEnglish
                ? 'assets/images/triangles/Right_E.png'
                : 'assets/images/triangles/Right_S.png'),
      ],
    );
  }

  Widget _buildTriangleTypeItem(
      String title, String description, String imagePath) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                // Add this to handle possible overflow
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 400, // Set your desired height
                      width: 600, // Set your desired width
                      child: Image.asset(
                        imagePath, // Replace with your asset path
                        height: 300.0,
                        width: 250.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        )),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
      },
      child: Card(
        color: Colors.white.withOpacity(0.8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              // Icon(icon, size: 30.0, color: color),
              const SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      description,
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 2.0
      ..style = PaintingStyle.fill; // to fill the triangle

    final path = Path();
    path.moveTo(size.width / 2, 20); // top point
    path.lineTo(20, size.height - 20); // bottom left point
    path.lineTo(size.width - 20, size.height - 20); // bottom right point
    path.close(); // closing the path to complete the triangle

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
