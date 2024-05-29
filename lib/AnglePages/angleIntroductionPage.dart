import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'angleSectionPage.dart';

void main() {
  runApp(AnglesIntroductionPage());
}

class AnglesIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Angles',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
  FlutterTts flutterTts = FlutterTts();
  bool _isSpeaking = false;
  int _voiceButtonClickCount = 0;
  String _pageContent = '';

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
    _updatePageContent();
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
    content += _isEnglish
        ? 'An angle is a figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle.'
        : 'Un ángulo es una figura formada por dos rayos, llamados los lados del ángulo, que comparten un punto final común, llamado el vértice del ángulo.';
    content += _isEnglish ? ' Types of Angles: ' : ' Tipos de Ángulos: ';
    content += _isEnglish ? '1. Acute Angle' : '1. Ángulo Agudo';
    content += _isEnglish
        ? ' An angle less than 90 degrees.'
        : ' Un ángulo menor de 90 grados.';
    content += _isEnglish ? '2. Right Angle' : '2. Ángulo Recto';
    content += _isEnglish
        ? ' An angle of exactly 90 degrees.'
        : ' Un ángulo de exactamente 90 grados.';
    content += _isEnglish ? '3. Obtuse Angle' : '3. Ángulo Obtuso';
    content += _isEnglish
        ? ' An angle greater than 90 degrees.'
        : ' Un ángulo mayor de 90 grados.';
    content += _isEnglish ? '4. Straight Angle' : '4. Ángulo Rectilíneo';
    content += _isEnglish
        ? ' An angle of exactly 180 degrees.'
        : ' Un ángulo de exactamente 180 grados.';
    content += _isEnglish ? '5. Reflex Angle' : '5. Ángulo Reflejo';
    content += _isEnglish
        ? ' An angle greater than 180 degrees and less than 360 degrees.'
        : ' Un ángulo mayor de 180 grados y menor de 360 grados.';
    content += _isEnglish
        ? '6. Full Rotation Angle' : '6. Ángulo de Rotación Completa';
    content += _isEnglish
        ? ' An angle of exactly 360 degrees.'
        : ' Un ángulo de exactamente 360 grados.';
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
        title: Text('Geometry: Angles'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => AnglesSectionsPage()),
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
                Image.asset(
                  'assets/images/angles/angles.png', // Update with your asset path
                  height: 300.0,
                  width: 250.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.0),
                _buildAngleDefinition(_isEnglish),
                SizedBox(height: 20.0),
                _buildAngleTypes(_isEnglish),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAngleDefinition(bool isEnglish) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isEnglish
              ? 'An angle is a figure formed by two rays, called the sides of the angle, sharing a common endpoint, called the vertex of the angle.'
              : 'Un ángulo es una figura formada por dos rayos, llamados los lados del ángulo, que comparten un punto final común, llamado el vértice del ángulo.',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildAngleTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Angles:' : 'Tipos de Ángulos:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
        _buildAngleTypeItem(
          isEnglish ? '1. Acute Angle' : '1. Ángulo Agudo',
          isEnglish
              ? 'An angle less than 90 degrees.'
              : 'Un ángulo menor de 90 grados.',
          Icons.access_alarm,
          Colors.orange,
        ),
        _buildAngleTypeItem(
          isEnglish ? '2. Right Angle' : '2. Ángulo Recto',
          isEnglish
              ? 'An angle of exactly 90 degrees.'
              : 'Un ángulo de exactamente 90 grados.',
          Icons.access_time,
          Colors.green,
        ),
        _buildAngleTypeItem(
          isEnglish ? '3. Obtuse Angle' : '3. Ángulo Obtuso',
          isEnglish
              ? 'An angle greater than 90 degrees.'
              : 'Un ángulo mayor de 90 grados.',
          Icons.account_balance,
          Colors.blue,
        ),
        _buildAngleTypeItem(
          isEnglish ? '4. Straight Angle' : '4. Ángulo Rectilíneo',
          isEnglish
              ? 'An angle of exactly 180 degrees.'
              : 'Un ángulo de exactamente 180 grados.',
          Icons.account_balance_wallet,
          Colors.purple,
        ),
        _buildAngleTypeItem(
          isEnglish ? '5. Reflex Angle' : '5. Ángulo Reflejo',
          isEnglish
              ? 'An angle greater than 180 degrees and less than 360 degrees.'
              : 'Un ángulo mayor de 180 grados y menor de 360 grados.',
          Icons.account_box,
          Colors.red,
        ),
        _buildAngleTypeItem(
          isEnglish ? '6. Full Rotation Angle' : '6. Ángulo de Rotación Completa',
          isEnglish
              ? 'An angle of exactly 360 degrees.'
              : 'Un ángulo de exactamente 360 grados.',
          Icons.add_alarm,
          Colors.brown,
        ),
      ],
    );
  }

  Widget _buildAngleTypeItem(
      String title, String description, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle interaction with the angle type item
        // Show additional information or properties
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: Text(description),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Close'),
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
              Icon(icon, size: 30.0, color: color),
              SizedBox(width: 16.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
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
