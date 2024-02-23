import 'package:flutter/material.dart';
import 'linesSectionPage.dart';

void main() {
  runApp(LinesIntroductionPage());
}

class LinesIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Lines',
      debugShowCheckedModeBanner: false, // Remove debug banner
      home: LinesIntroductionGeometryPage(),
    );
  }
}

class LinesIntroductionGeometryPage extends StatefulWidget {
  @override
  _LinesIntroductionGeometryPageState createState() => _LinesIntroductionGeometryPageState();
}

class _LinesIntroductionGeometryPageState extends State<LinesIntroductionGeometryPage> {
  bool _isEnglish = true;

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry: Lines'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LinesSectionsPage()), // Navigate back to PAGE2.dart
                ); // Navigate back when arrow is pressed
              },
            ),

        
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: _toggleLanguage,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isEnglish ? 'Lines' : 'Líneas',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              _buildLineDiagram(),
              SizedBox(height: 20.0),
              _buildLineDefinition(_isEnglish),
              SizedBox(height: 20.0),
              _buildLineTypes(_isEnglish),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLineDiagram() {
    return SizedBox(
      height: 100.0,
      child: CustomPaint(
        painter: LinePainter(),
      ),
    );
  }

  Widget _buildLineDefinition(bool isEnglish) {
    return Text(
      isEnglish
          ? 'A line is a straight path that extends infinitely in both directions.'
          : 'Una línea es una trayectoria recta que se extiende infinitamente en ambas direcciones.',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildLineTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Lines:' : 'Tipos de Líneas:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildLineTypeItem(
          isEnglish ? '1. Straight Line' : '1. Línea Recta',
          isEnglish
              ? 'A line that has no curves.'
              : 'Una línea que no tiene curvas.',
        ),
        _buildLineTypeItem(
          isEnglish ? '2. Ray' : '2. Rayo',
          isEnglish
              ? 'A part of a line with one endpoint.'
              : 'Una parte de una línea con un punto final.',
        ),
        _buildLineTypeItem(
          isEnglish ? '3. Line Segment' : '3. Segmento de Línea',
          isEnglish
              ? 'A part of a line with two endpoints.'
              : 'Una parte de una línea con dos puntos finales.',
        ),
      ],
    );
  }

  Widget _buildLineTypeItem(String title, String description) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5.0),
          Text(description),
        ],
      ),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    canvas.drawLine(
      Offset(20, size.height / 2),
      Offset(size.width - 20, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
