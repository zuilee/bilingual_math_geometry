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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
      content += '1. Line. It is a line that has no endpoints.';
      content += '2. Ray. A part of a line with one endpoint.';
      content += '3. Line Segment. A part of a line with two endpoints.';
      content += '4. Parallel Lines. Lines that never intersect.';
      content += '5. Perpendicular Lines. Lines that intersect at 90 degrees.';
      content += '6. Intersection Lines. Lines that intersect at a point.';
    } else {
      content =
          'Una línea es una trayectoria recta que se extiende infinitamente en ambas direcciones.';
      content += 'Tipos de Líneas:';
      content += '1. Línea Recta. Una línea que no tiene puntos finales.';
      content += '2. Rayo. Una parte de una línea con un punto final.';
      content +=
          '3. Segmento de Línea. Una parte de una línea con dos puntos finales.';
      content += '4. Líneas Paralelas. Líneas que nunca se intersecan.';
      content +=
          '5. Líneas Perpendiculares. Líneas que se intersecan en 90 grados.';
      content +=
          '6. Líneas de Intersección. Líneas que se intersecan en un punto.';
    }

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
        title: Text('Geometry: Lines'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      LinesSectionsPage()), // Navigate back to LinesSectionsPage
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.translate),
            onPressed: _toggleLanguage,
          ),
          IconButton(
            icon: Icon(Icons.record_voice_over,
                color: _isSpeaking ? Colors.blue : null),
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
                  'assets/images/lines/lines_copy.png', // Replace with your asset path
                  height: 300.0,
                  width: 250.0,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 20.0),
                _buildLineDefinition(_isEnglish),
                SizedBox(height: 20.0),
                _buildLineTypes(_isEnglish),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLineDefinition(bool isEnglish) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isEnglish
              ? 'A line is a straight path that extends infinitely in both directions.'
              : 'Una línea es una trayectoria recta que se extiende infinitamente en ambas direcciones.',
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Widget _buildLineTypes(bool isEnglish) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isEnglish ? 'Types of Lines:' : 'Tipos de Líneas:',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10.0),
        _buildLineTypeItem(
          isEnglish ? '1. Line' : '1. Línea Recta',
          isEnglish
              ? 'It is a line that has no endpoints.'
              : 'Una línea que no tiene puntos finales.',
          Icons.show_chart,
          Colors.orange,
        ),
        _buildLineTypeItem(
          isEnglish ? '2. Ray' : '2. Rayo',
          isEnglish
              ? 'A part of a line with one endpoint.'
              : 'Una parte de una línea con un punto final.',
          Icons.timeline,
          Colors.green,
        ),
        _buildLineTypeItem(
          isEnglish ? '3. Line Segment' : '3. Segmento de Línea',
          isEnglish
              ? 'A part of a line with two endpoints.'
              : 'Una parte de una línea con dos puntos finales.',
          Icons.show_chart_outlined,
          Colors.blue,
        ),
        _buildLineTypeItem(
          isEnglish ? '4. Parallel Lines' : '4. Líneas Paralelas',
          isEnglish
              ? 'Lines that never intersect.'
              : 'Líneas que nunca se intersecan.',
          Icons.import_export,
          Colors.purple,
        ),
        _buildLineTypeItem(
          isEnglish ? '5. Perpendicular Lines' : '5. Líneas Perpendiculares',
          isEnglish
              ? 'Lines that intersect at 90 degrees.'
              : 'Líneas que se intersecan en 90 grados.',
          Icons.crop_square_rounded,
          Colors.red,
        ),
        _buildLineTypeItem(
          isEnglish ? '6. Intersection Lines' : '6. Líneas de Intersección',
          isEnglish
              ? 'Lines that intersect at a point.'
              : 'Líneas que se intersecan en un punto.',
          Icons.view_stream,
          Colors.teal,
        ),
      ],
    );
  }

  Widget _buildLineTypeItem(
      String title, String description, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
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