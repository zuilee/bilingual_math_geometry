import 'package:flutter/material.dart';
import 'main.dart';

class SectionsPage extends StatelessWidget {
  final String title;
  final List<Map<String, dynamic>> sectionItems;

  const SectionsPage({super.key, required this.title, required this.sectionItems});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double horizontalPadding = screenWidth * 0.10;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/backgroundd.gif', fit: BoxFit.cover),
          ),
          Positioned.fill(child: CustomPaint(painter: _WaveHeaderPainter())),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 140,
                  child: Stack(
                    children: [
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
                const SizedBox(height: 80),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                    child: ListView.separated(
                      itemCount: sectionItems.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 35),
                      itemBuilder: (context, index) {
                        final item = sectionItems[index];
                        return _buildSectionTile(
                          context,
                          item['title'],
                          item['icon'],
                          item['color'],
                          item['page'],
                        );
                      },
                    ),
                  ),
                ),
              ],
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
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => page)),
      child: Material(
        elevation: 4,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          height: 100,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(20)),
          child: Stack(
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
