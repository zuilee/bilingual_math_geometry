import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'shapes_data.dart';
import '../sections.dart';

class GenericIntroductionPage extends StatefulWidget {
  final String shapeName;
  const GenericIntroductionPage({super.key, required this.shapeName});

  @override
  _GenericIntroductionPageState createState() =>
      _GenericIntroductionPageState();
}

class _GenericIntroductionPageState extends State<GenericIntroductionPage> {
  bool _isEnglish = true;
  FlutterTts flutterTts = FlutterTts();
  bool _isSpeaking = false;
  int _voiceButtonClickCount = 0;
  String _pageContent = '';

  // Retrieve the shape's data and introduction info from shapes_data.dart
  Map<String, dynamic> get shapeData =>
      shapes.firstWhere((element) => element['name'] == widget.shapeName);
  Map<String, dynamic> get introData => shapeData['intro'];

  @override
  void initState() {
    super.initState();
    _updatePageContent();
  }

  void _toggleLanguage() {
    setState(() {
      _isEnglish = !_isEnglish;
    });
    _updatePageContent();
  }

  void _updatePageContent() {
    setState(() {
      _pageContent = _getPageContent();
    });
  }

  String _getPageContent() {
    // Concatenate the definition and types text for TTS.
    String content = _isEnglish
        ? introData['definition']['en']
        : introData['definition']['es'];
    content += _isEnglish
        ? ' Types of ${widget.shapeName}:'
        : ' Tipos de ${widget.shapeName}:';
    for (var type in introData['types']) {
      content += " " +
          (_isEnglish ? type['title']['en'] : type['title']['es']) +
          ". " +
          (_isEnglish
              ? type['description']['en']
              : type['description']['es']);
    }
    return content;
  }

  Future<void> _speak(String text) async {
    if (_isSpeaking) {
      await flutterTts.stop();
      setState(() {
        _isSpeaking = false;
        _voiceButtonClickCount = 0;
      });
    } else {
      setState(() {
        _isSpeaking = true;
      });
      await flutterTts.setLanguage(_isEnglish ? 'en-US' : 'es-ES');
      await flutterTts.setSpeechRate(0.5);
      await flutterTts.setPitch(1.0);
      await flutterTts.speak(text);
    }
  }

  Widget _buildDefinition(bool isEnglish) {
    return Card(
      color: Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isEnglish
              ? introData['definition']['en']
              : introData['definition']['es'],
          style:
              const TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTypes(bool isEnglish) {
    String headerText = isEnglish
        ? 'Types of ${widget.shapeName}:'
        : 'Tipos de ${widget.shapeName}:';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 10.0),
        ...introData['types'].map<Widget>((type) {
          String title = isEnglish ? type['title']['en'] : type['title']['es'];
          String description = isEnglish
              ? type['description']['en']
              : type['description']['es'];
          String imagePath = isEnglish
              ? type['image']['en']
              : type['image']['es'];
          return _buildTypeItem(title, description, imagePath);
        }).toList(),
      ],
    );
  }

  Widget _buildTypeItem(String title, String description, String imagePath) {
    return GestureDetector(
      onTap: () {
        // On tap, show an AlertDialog with a larger view.
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(title),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 400,
                      width: 600,
                      child: Image.asset(
                        imagePath,
                        height: 300.0,
                        width: 250.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    const SizedBox(height: 5.0),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 14.0),
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

  @override
  Widget build(BuildContext context) {
    String mainImage = _isEnglish
        ? introData['mainImage']['en']
        : introData['mainImage']['es'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Geometry: ${widget.shapeName}'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => SectionsPage(
                  title: widget.shapeName,
                  sectionItems: List<Map<String, dynamic>>.from(
                      shapeData['section']),
                ),
              ),
            );
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.translate),
            onPressed: _toggleLanguage,
          ),
          IconButton(
            icon: Icon(
              Icons.record_voice_over,
              color: _isSpeaking ? Colors.blue : null,
            ),
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
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white60, Colors.white70],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (mainImage.isNotEmpty)
                Image.asset(
                  mainImage,
                  height: 400.0,
                  width: 300.0,
                  fit: BoxFit.contain,
                ),
              const SizedBox(height: 20.0),
              _buildDefinition(_isEnglish),
              const SizedBox(height: 20.0),
              _buildTypes(_isEnglish),
            ],
          ),
        ),
      ),
    );
  }
}
