import 'package:flutter/material.dart';
import 'main.dart';

class SectionsPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> sectionItems;

  const SectionsPage({super.key, required this.title, required this.sectionItems});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.10;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background
          Positioned.fill(
            child: Image.asset('assets/images/backgroundd.gif', fit: BoxFit.cover),
          ),

          // Scrollable Content Below Wave
          Positioned.fill(
            top: 140,
            child: SingleChildScrollView(
              clipBehavior: Clip.none,
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.10,
                  bottom: 24.0,
                  left: horizontalPadding,
                  right: horizontalPadding,
                ),
                child: Column(
                  children: List.generate(sectionItems.length, (index) {
                    final item = sectionItems[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: _buildSectionTile(
                        context,
                        item['title'],
                        item['icon'],
                        item['color'],
                        item['page'],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),

          // Header + Back Icon
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 140,
            child: SafeArea(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  // Wave Background
                  Positioned.fill(child: CustomPaint(painter: _WaveHeaderPainter())),

                  // Back Button
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, size: 34, color: Colors.white),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BilingualMathGeoHomePage(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Title
                  Center(
                    child: Text(
                      title.toUpperCase(),
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black26)],
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

  Widget _buildSectionTile(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
        child: Material(
          elevation: 4,
          clipBehavior: Clip.none,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            height: 100,
            decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(icon, color: Colors.white.withOpacity(0.15), size: 48),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icon, size: 40, color: Colors.white),
                      const SizedBox(width: 16),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          shadows: [Shadow(offset: Offset(1, 1), blurRadius: 2, color: Colors.black26)],
                        ),
                      ),
                    ],
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

class _WaveHeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final secondaryPaint = Paint()..color = const Color(0xFFB3E5FC);
    final secondaryPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 160)
      ..quadraticBezierTo(size.width * 0.25, 200, size.width * 0.5, 160)
      ..quadraticBezierTo(size.width * 0.75, 120, size.width, 160)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(secondaryPath, secondaryPaint);

    final primaryPaint = Paint()..color = const Color(0xFF4A90E2);
    final primaryPath = Path()
      ..moveTo(0, 0)
      ..lineTo(0, 140)
      ..quadraticBezierTo(size.width * 0.25, 180, size.width * 0.5, 140)
      ..quadraticBezierTo(size.width * 0.75, 100, size.width, 140)
      ..lineTo(size.width, 0)
      ..close();
    canvas.drawPath(primaryPath, primaryPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
