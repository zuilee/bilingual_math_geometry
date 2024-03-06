import 'package:bilingual_math_geometry/AnglePages/angleSectionPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';


void main() {
  runApp(AnglesIntroductionPage());
}

class AnglesIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Angles',
      debugShowCheckedModeBanner: false,
      home: AnglesIntroductionGeometryPage(),
    );
  }
}

class AnglesIntroductionGeometryPage extends StatefulWidget {
  @override
  _AnglesIntroductionGeometryPageState createState() =>
      _AnglesIntroductionGeometryPageState();
}

class _AnglesIntroductionGeometryPageState
    extends State<AnglesIntroductionGeometryPage> {
  bool _isEnglish = true;
  bool _isSpeaking = false;
  int _voiceButtonClickCount = 0;
  String _pageContent = '';
  FlutterTts flutterTts = FlutterTts();

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
    var content = _isEnglish ? 'An angle is a figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle.': 'Un ángulo es una figura formada por dos rayos, llamados los lados del ángulo, que comparten un punto final común, llamado el vértice del ángulo.';
    content += _isEnglish ? 'Types of Angles:' : 'Tipos de Ángulos:';
    content += _isEnglish ? '1. Acute Angle' : '1. Ángulo Agudo';
    content += _isEnglish ? 'An angle less than 90 degrees.' : 'Un ángulo menor de 90 grados.';
    content += _isEnglish ? '2. Right Angle' : '2. Ángulo Recto';
    content += _isEnglish ? 'An angle of exactly 90 degrees.' : 'Un ángulo de exactamente 90 grados.';
    content += _isEnglish ? '3. Obtuse Angle' : '3. Ángulo Obtuso';
    content += _isEnglish ? 'An angle greater than 90 degrees.' : 'Un ángulo mayor de 90 grados.';
    content += _isEnglish ? '4. Straight Angle' : '4. Ángulo Rectilíneo';
    content += _isEnglish ? 'An angle of exactly 180 degrees.' : 'Un ángulo de exactamente 180 grados.';
    content += _isEnglish ? '5. Reflex Angle' : '5. Ángulo Reflejo';
    content += _isEnglish ? 'An angle greater than 180 degrees and less than 360 degrees.' : 'Un ángulo mayor de 180 grados y menor de 360 grados.';
    return content;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry: Angles'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AnglesSectionsPage()), // Navigate back to PAGE2.dart
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
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _isEnglish ? 'Angles' : 'Ángulos',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            _buildAngleDiagram(AngleType.Acute),
            SizedBox(height: 20.0),
            _buildAngleDefinition(_isEnglish),
            SizedBox(height: 20.0),
            _buildAngleTypes(_isEnglish),
          ],
        ),
      ),
    );
  }

  Widget _buildAngleDiagram(AngleType angleType) {
    return SizedBox(
      height: 100.0,
      child: CustomPaint(
        painter: AnglePainter(angleType),
      ),
    );
  }

  Widget _buildAngleDefinition(bool isEnglish) {
    return Text(
      isEnglish
          ? 'An angle is a figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle.'
          : 'Un ángulo es una figura formada por dos rayos, llamados los lados del ángulo, que comparten un punto final común, llamado el vértice del ángulo.',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget _buildAngleTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Angles:' : 'Tipos de Ángulos:',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10.0),
        _buildAngleTypeItem(
          isEnglish ? '1. Acute Angle' : '1. Ángulo Agudo',
          isEnglish ? 'An angle less than 90 degrees.' : 'Un ángulo menor de 90 grados.',
        ),
        _buildAngleTypeItem(
          isEnglish ? '2. Right Angle' : '2. Ángulo Recto',
          isEnglish ? 'An angle of exactly 90 degrees.' : 'Un ángulo de exactamente 90 grados.',
        ),
        _buildAngleTypeItem(
          isEnglish ? '3. Obtuse Angle' : '3. Ángulo Obtuso',
          isEnglish ? 'An angle greater than 90 degrees.' : 'Un ángulo mayor de 90 grados.',
        ),
        _buildAngleTypeItem(
          isEnglish ? '4. Straight Angle' : '4. Ángulo Rectilíneo',
          isEnglish ? 'An angle of exactly 180 degrees.' : 'Un ángulo de exactamente 180 grados.',
        ),
        _buildAngleTypeItem(
          isEnglish ? '5. Reflex Angle' : '5. Ángulo Reflejo',
          isEnglish ? 'An angle greater than 180 degrees and less than 360 degrees.' : 'Un ángulo mayor de 180 grados y menor de 360 grados.',
        ),
      ],
    );
  }

  Widget _buildAngleTypeItem(String title, String description) {
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

enum AngleType {
  Acute,
  Right,
  Obt
  }
class AnglePainter extends CustomPainter {
  final AngleType angleType;

  AnglePainter(this.angleType);

  @override
  void paint(Canvas canvas, Size size) {
    // Your painting logic here based on the angle type
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}