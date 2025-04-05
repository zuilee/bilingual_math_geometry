import 'package:flutter/material.dart';
import 'sections.dart';
import 'shapes_data.dart';
import 'theme_state.dart';

void main() {
  runApp(BilingualMathGeo());
}

class BilingualMathGeo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Wrap MaterialApp in AnimatedBuilder so that any change in themeModel rebuilds it immediately.
    return AnimatedBuilder(
      animation: themeModel,
      builder: (context, _) {
        return MaterialApp(
          title: 'EXPLORA - GEOMETRY',
          debugShowCheckedModeBanner: false,
          home: BilingualMathGeoHomePage(),
        );
      },
    );
  }
}

class BilingualMathGeoHomePage extends StatefulWidget {
  @override
  State<BilingualMathGeoHomePage> createState() =>
      _BilingualMathGeoHomePageState();
}

class _BilingualMathGeoHomePageState extends State<BilingualMathGeoHomePage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode = themeModel.isDarkMode;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Smoothly fading background image.
          Positioned.fill(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                key: ValueKey(isDarkMode),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(isDarkMode
                        ? 'assets/images/backgroundd-dark.gif'
                        : 'assets/images/backgroundd.gif'),
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              ),
            ),
          ),
          // Scrollable content with padding.
          Positioned.fill(
            top: 160,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.10,
                  bottom: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    int count = constraints.maxWidth < 600
                        ? 1
                        : (constraints.maxWidth < 900 ? 2 : 3);
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      clipBehavior: Clip.none,
                      itemCount: shapes.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 3.0,
                      ),
                      itemBuilder: (context, index) {
                        final shape = shapes[index];
                        // Choose darkcolor if dark mode is enabled.
                        Color tileColor = isDarkMode
                            ? shape['darkcolor'] as Color
                            : shape['color'] as Color;
                        return _buildShapeTile(
                          context,
                          shape['name'],
                          shape['icon'],
                          tileColor,
                          shape['section'],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
          // Top Wave with Title and Toggle Button.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 160,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned.fill(
                    child: CustomPaint(
                      painter: _WaveBackgroundPainter(isDarkMode: isDarkMode),
                    ),
                  ),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'EXPLORA - GEOMETRY',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Toggle Button with pointer cursor.
                  Positioned(
                    right: 24,
                    top: 56,
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          themeModel.toggleTheme();
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          width: 60,
                          height: 32,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          decoration: BoxDecoration(
                            color: isDarkMode
                                ? Colors.indigo.withOpacity(0.8)
                                : Colors.yellow.shade600.withOpacity(0.85),
                            borderRadius: BorderRadius.circular(30),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              AnimatedAlign(
                                duration: const Duration(milliseconds: 300),
                                alignment: isDarkMode
                                    ? Alignment.centerRight
                                    : Alignment.centerLeft,
                                child: Icon(
                                  isDarkMode
                                      ? Icons.nightlight_round
                                      : Icons.wb_sunny,
                                  size: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildShapeTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    List<Map<String, dynamic>> sectionItems,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SectionsPage(
                title: title,
                sectionItems: sectionItems,
              ),
            ),
          );
        },
        child: Material(
          elevation: 5,
          clipBehavior: Clip.none,
          borderRadius: BorderRadius.circular(20),
          color: color,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, color: Colors.white, size: 36),
                    const SizedBox(width: 12),
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10,
                  right: 14,
                  child: Icon(
                    icon,
                    color: Colors.white.withOpacity(0.22),
                    size: 48,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WaveBackgroundPainter extends CustomPainter {
  final bool isDarkMode;
  _WaveBackgroundPainter({required this.isDarkMode});
  
  @override
  void paint(Canvas canvas, Size size) {
    final secondaryPaint = Paint()
      ..color = isDarkMode ? const Color(0xFF2F4B73) : const Color(0xFFB3E5FC);
    final secondaryPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 160)
      ..quadraticBezierTo(size.width * 0.25, 200, size.width * 0.5, 160)
      ..quadraticBezierTo(size.width * 0.85, 140, size.width, 200)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(secondaryPath, secondaryPaint);
    final primaryPaint = Paint()
      ..color = isDarkMode ? const Color(0xFF1C2C4C) : const Color(0xFF4A90E2);
    final primaryPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 140)
      ..quadraticBezierTo(size.width * 0.25, 180, size.width * 0.5, 140)
      ..quadraticBezierTo(size.width * 0.85, 100, size.width, 160)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(primaryPath, primaryPaint);
  }
  
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
