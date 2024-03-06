import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
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
  _LinesIntroductionGeometryPageState createState() =>
      _LinesIntroductionGeometryPageState();
}

class _LinesIntroductionGeometryPageState
    extends State<LinesIntroductionGeometryPage> {
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
    var content = "";
    if (_isEnglish) {
      content =
          'A line is a straight path that extends infinitely in both directions.';
      content += 'Types of Lines:';
      content += '1. Straight Line. It is a line that has no curves.';
      content += '2. Ray. A part of a line with one endpoint.';
      content += '3. Line Segment. A part of a line with two endpoints.';
    } else {
      content =
          'Una línea es una trayectoria recta que se extiende infinitamente en ambas direcciones.';
      content += 'Tipos de Líneas:';
      content += '1. Línea Recta. Una línea que no tiene curvas.';
      content += '2. Rayo. Una parte de una línea con un punto final.';
      content +=
          '3. Segmento de Línea. Una parte de una línea con dos puntos finales.';
    }

    return content;
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
              MaterialPageRoute(
                  builder: (context) =>
                      LinesSectionsPage()), // Navigate back to PAGE2.dart
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
                color: _isSpeaking ? Colors.blue : null), // Change color when speaking
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
