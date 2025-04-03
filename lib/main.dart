import 'package:flutter/material.dart';
import 'sections.dart';
import 'shapes_data.dart';

void main() {
  runApp(const BilingualMathGeo());
}

class BilingualMathGeo extends StatelessWidget {
  const BilingualMathGeo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EXPLORA - GEOMETRY',
      theme: ThemeData(primaryColor: Colors.white),
      home: const BilingualMathGeoHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class BilingualMathGeoHomePage extends StatelessWidget {
  const BilingualMathGeoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Fixed Background GIF
          Positioned.fill(
            child: Image.asset(
              'assets/images/backgroundd.gif',
              fit: BoxFit.cover,
            ),
          ),

          // Scrollable content with 10% vertical padding at top
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
                        return _buildShapeTile(
                          context,
                          shape['name'],
                          shape['icon'],
                          shape['color'],
                          shape['section'],
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),

          // Fixed blue wave at top
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
                    child: CustomPaint(painter: _WaveBackgroundPainter()),
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
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
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
