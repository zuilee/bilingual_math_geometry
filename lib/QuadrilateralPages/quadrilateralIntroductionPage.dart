import 'package:flutter/material.dart';
import 'quadrilateralSectionPage.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(QuadrilateralIntroductionPage());
}

class QuadrilateralIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Quadrilaterals',
      debugShowCheckedModeBanner: false,
      home: QuadrilateralIntroductionGeometryPage(),
    );
  }
}

class QuadrilateralIntroductionGeometryPage extends StatefulWidget {
  @override
  _QuadrilateralIntroductionGeometryPageState createState() => _QuadrilateralIntroductionGeometryPageState();
}

class _QuadrilateralIntroductionGeometryPageState extends State<QuadrilateralIntroductionGeometryPage> {
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
    var content = "";
    content = _isEnglish
        ? 'A quadrilateral is a polygon with four edges (sides) and four vertices (corners).'
        : 'Un cuadrilátero es un polígono con cuatro lados y cuatro vértices.';
    content =
        _isEnglish ? 'Types of Quadrilaterals:' : 'Tipos de Cuadriláteros:';
    content = _isEnglish ? '1. Square' : '1. Cuadrado';
    content = _isEnglish
        ? 'A quadrilateral with all four sides of equal length and all angles equal to 90 degrees.'
        : 'Un cuadrilátero con los cuatro lados de igual longitud y todos los ángulos iguales a 90 grados.';
    content = _isEnglish ? '2. Rectangle' : '2. Rectángulo';
    content = _isEnglish
        ? 'A quadrilateral with opposite sides equal in length and all angles equal to 90 degrees.'
        : 'Un cuadrilátero con lados opuestos de igual longitud y todos los ángulos iguales a 90 grados.';
    content = _isEnglish ? '3. Rhombus' : '3. Rombus';
    content = _isEnglish
        ? 'A quadrilateral with all four sides of equal length.'
        : 'Un cuadrilátero con los cuatro lados de igual longitud.';
    content = _isEnglish ? '4. Trapezoid' : '4. Trapecio';
    content = _isEnglish
        ? 'A quadrilateral with at least one pair of parallel sides.'
        : 'Un cuadrilátero con al menos un par de lados paralelos.';
    return content;
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry: Quadrilateral'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      QuadrilateralSectionsPage()), // Navigate back to PAGE2.dart
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                _isEnglish ? 'Quadrilateral' : 'Cuadriláteros',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20.0),
              _buildQuadrilateralDiagram(),
              SizedBox(height: 20.0),
              _buildQuadrilateralDefinition(_isEnglish),
              SizedBox(height: 20.0),
              _buildQuadrilateralTypes(_isEnglish),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuadrilateralDiagram() {
    return SizedBox(
      height: 100.0,
      child: CustomPaint(
        painter: QuadrilateralPainter(),
      ),
    );
  }

  Widget _buildQuadrilateralDefinition(bool isEnglish) {
    return Text(
      isEnglish
          ? 'A quadrilateral is a polygon with four edges (sides) and four vertices (corners).'
          : 'Un cuadrilátero es un polígono con cuatro lados y cuatro vértices.',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildQuadrilateralTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Quadrilaterals:' : 'Tipos de Cuadriláteros:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildQuadrilateralTypeItem(
          isEnglish ? '1. Square' : '1. Cuadrado',
          isEnglish
              ? 'A quadrilateral with all four sides of equal length and all angles equal to 90 degrees.'
              : 'Un cuadrilátero con los cuatro lados de igual longitud y todos los ángulos iguales a 90 grados.',
        ),
        _buildQuadrilateralTypeItem(
          isEnglish ? '2. Rectangle' : '2. Rectángulo',
          isEnglish
              ? 'A quadrilateral with opposite sides equal in length and all angles equal to 90 degrees.'
              : 'Un cuadrilátero con lados opuestos de igual longitud y todos los ángulos iguales a 90 grados.',
        ),
        _buildQuadrilateralTypeItem(
          isEnglish ? '3. Rhombus' : '3. Rombus',
          isEnglish
              ? 'A quadrilateral with all four sides of equal length.'
              : 'Un cuadrilátero con los cuatro lados de igual longitud.',
        ),
        _buildQuadrilateralTypeItem(
          isEnglish ? '4. Trapezoid' : '4. Trapecio',
          isEnglish
              ? 'A quadrilateral with at least one pair of parallel sides.'
              : 'Un cuadrilátero con al menos un par de lados paralelos.',
        ),
      ],
    );
  }

  Widget _buildQuadrilateralTypeItem(String title, String description) {
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

class QuadrilateralPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.orange
      ..strokeWidth = 2.0;

    canvas.drawLine(Offset(20, 20), Offset(size.width - 20, 20), paint);
    canvas.drawLine(Offset(size.width - 20, 20),
        Offset(size.width - 20, size.height - 20), paint);
    canvas.drawLine(Offset(size.width - 20, size.height - 20),
        Offset(20, size.height - 20), paint);
    canvas.drawLine(Offset(20, size.height - 20), Offset(20, 20), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
