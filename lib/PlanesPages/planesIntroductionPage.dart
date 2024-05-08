import 'package:flutter/material.dart';
import 'planesSectionPage.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main() {
  runApp(PlanesIntroductionPage());
}

class PlanesIntroductionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Geometry: Planes',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: PlanesIntroductionGeometryPage(),
    );
  }
}

class PlanesIntroductionGeometryPage extends StatefulWidget {
  @override
  _PlanesIntroductionGeometryPageState createState() =>
      _PlanesIntroductionGeometryPageState();
}

class _PlanesIntroductionGeometryPageState
    extends State<PlanesIntroductionGeometryPage> {
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
    content += _isEnglish
        ? 'A plane is a flat, two-dimensional surface that extends infinitely in all directions.'
        : 'Un plano es una superficie plana bidimensional que se extiende infinitamente en todas direcciones.';
    content += _isEnglish ? 'Types of Planes:' : 'Tipos de Planos:';
    content += _isEnglish
        ? '1. Horizontal Plane. A plane that is parallel to the horizon.Horizontal planes are flat surfaces that are parallel to the ground or horizontal reference plane.Examples of horizontal planes include the surface of a table, the floor.'
        : '1. Plano Horizontal. Un plano que es paralelo al horizonte.Los planos horizontales son superficies planas paralelas al suelo o al plano de referencia horizontal.Ejemplos de planos horizontales incluyen la superficie de una mesa, el suelo';
    content += _isEnglish
        ? '2. Vertical Plane. Vertical planes are flat surfaces that are perpendicular to the horizontal reference plane. They are oriented vertically, like the walls of a room or the yz-plane in a 3D coordinate system.'
        : '2. Plano Vertical. Los planos verticales son superficies planas que son perpendiculares al plano de referencia horizontal. Están orientados verticalmente, como las paredes de una habitación o el plano yz en un sistema de coordenadas 3D.';
    content += _isEnglish
        ? '3. Inclined Plane. A plane that is at an angle to the horizontal plane.Inclined planes, also known as ramps, are flat surfaces that are tilted or angled relative to the horizontal reference plane. They are neither horizontal nor vertical, but lie at some angle in between.'
        : '3. Plano Inclinado. Un plano que está en un ángulo con respecto al plano horizontal. Los planos inclinados, también conocidos como rampas, son superficies planas que están inclinadas o en ángulo con respecto al plano de referencia horizontal. No son ni horizontales ni verticales, sino que se encuentran en algún ángulo intermedio.';
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
        title: Text('Geometry: Planes'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Add back arrow icon
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PlanesSectionsPage()), // Navigate back to PAGE2.dart
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
                  'assets/images/plane/plane_image.png', // Update with your asset path
                  height: 300.0,
                  width: 250.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.0),
                _buildPlaneDefinition(_isEnglish),
                SizedBox(height: 20.0),
                _buildPlaneTypes(_isEnglish),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPlaneDefinition(bool isEnglish) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isEnglish
              ? 'A plane is a flat, two-dimensional surface that extends infinitely in all directions.'
              : 'Un plano es una superficie plana bidimensional que se extiende infinitamente en todas direcciones.',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildPlaneTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Planes:' : 'Tipos de Planos:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
        _buildPlaneTypeItem(
          isEnglish ? '1. Horizontal Plane' : '1. Plano Horizontal',
          isEnglish
              ? 'A plane that is parallel to the horizon.Horizontal planes are flat surfaces that are parallel to the ground or horizontal reference plane.Examples of horizontal planes include the surface of a table, the floor.'
              : 'Un plano que es paralelo al horizonte.Los planos horizontales son superficies planas paralelas al suelo o al plano de referencia horizontal.Ejemplos de planos horizontales incluyen la superficie de una mesa, el suelo',
          Icons.horizontal_split,
          Colors.orange,
        ),
        _buildPlaneTypeItem(
          isEnglish ? '2. Vertical Plane' : '2. Plano Vertical',
          isEnglish
              ? 'Vertical planes are flat surfaces that are perpendicular to the horizontal reference plane. They are oriented vertically, like the walls of a room or the yz-plane in a 3D coordinate system.'
              : 'Los planos verticales son superficies planas que son perpendiculares al plano de referencia horizontal. Están orientados verticalmente, como las paredes de una habitación o el plano yz en un sistema de coordenadas 3D.',
          Icons.vertical_split,
          Colors.green,
        ),
        _buildPlaneTypeItem(
          isEnglish ? '3. Inclined Plane' : '3. Plano Inclinado',
          isEnglish
              ? 'A plane that is at an angle to the horizontal plane.Inclined planes, also known as ramps, are flat surfaces that are tilted or angled relative to the horizontal reference plane. They are neither horizontal nor vertical, but lie at some angle in between.'
              : 'Un plano que está en un ángulo con respecto al plano horizontal.Los planos inclinados, también conocidos como rampas, son superficies planas que están inclinadas o en ángulo con respecto al plano de referencia horizontal. No son ni horizontales ni verticales, sino que se encuentran en algún ángulo intermedio.',
          Icons.trending_up,
          Colors.blue,
        ),
      ],
    );
  }

  Widget _buildPlaneTypeItem(
      String title, String description, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle interaction with the plane type item
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
