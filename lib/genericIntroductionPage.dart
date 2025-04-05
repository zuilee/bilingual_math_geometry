import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'shapes_data.dart';
// import '../sections.dart';
import 'theme_state.dart';

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

  /// Builds the definition card at the top of the page.
  Widget _buildDefinition(bool isEnglish, bool isDark) {
    return Card(
      // Card background
      color: isDark ? const Color(0xFF171717) : Colors.white.withOpacity(0.8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          isEnglish
              ? introData['definition']['en']
              : introData['definition']['es'],
          style: TextStyle(
            fontSize: 19.0,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  /// Builds the list of types (e.g. "Acute Angle", "Right Angle", etc.)
  Widget _buildTypes(bool isEnglish, bool isDark) {
    String headerText = isEnglish
        ? 'Types of ${widget.shapeName}:'
        : 'Tipos de ${widget.shapeName}:';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headerText,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: isDark ? Colors.white : Colors.black,
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
          return _buildTypeItem(title, description, imagePath, isDark);
        }).toList(),
      ],
    );
  }

  /// Builds each clickable item in the list of types (with image & description).
  Widget _buildTypeItem(String title, String description, String imagePath, bool isDark) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              // Popup background
              backgroundColor: isDark ? const Color.fromARGB(255, 49, 49, 49) : Colors.white,
              title: Text(
                title,
                style: TextStyle(
                  color: isDark ? Colors.white : Colors.black,
                ),
              ),
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
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  style: TextButton.styleFrom(
                    // "Close" button text color
                    foregroundColor: isDark ? Colors.white : Colors.black,
                  ),
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
        // Card background
        color: isDark ? const Color(0xFF171717) : Colors.white.withOpacity(0.8),
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
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                    ),
                    const SizedBox(height: 5.0),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: isDark ? Colors.white : Colors.black,
                      ),
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
    return AnimatedBuilder(
      animation: themeModel,
      builder: (context, _) {
        bool isDark = themeModel.isDarkMode;
        String mainImage = _isEnglish
            ? introData['mainImage']['en']
            : introData['mainImage']['es'];

        return Scaffold(
          // AppBar with dark mode styling
          appBar: AppBar(
            backgroundColor: isDark ? const Color(0xFF171717) : Colors.white,
            iconTheme: IconThemeData(
              color: isDark ? Colors.white : Colors.black,
            ),
            title: Text(
              'Geometry: ${widget.shapeName}',
              style: TextStyle(
                color: isDark ? Colors.white : Colors.black,
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.translate,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: _toggleLanguage,
              ),
              IconButton(
                icon: Icon(
                  Icons.record_voice_over,
                  // If speaking, show blue; else white/black based on mode
                  color: _isSpeaking
                      ? Colors.blue
                      : (isDark ? Colors.white : Colors.black),
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
              ),
              IconButton(
                icon: Icon(
                  isDark ? Icons.nightlight_round : Icons.wb_sunny,
                  color: isDark ? Colors.white : Colors.black,
                ),
                onPressed: () {
                  themeModel.toggleTheme();
                },
              ),
            ],
          ),
          // Body background color
          body: Container(
            color: isDark ? const Color(0xFF212121) : Colors.white,
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
                  _buildDefinition(_isEnglish, isDark),
                  const SizedBox(height: 20.0),
                  _buildTypes(_isEnglish, isDark),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
