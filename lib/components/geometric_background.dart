import 'dart:ui';
import 'package:flutter/material.dart';

class GeometricBackground extends StatefulWidget {
  final Widget child;
  const GeometricBackground({super.key, required this.child});

  @override
  State<GeometricBackground> createState() => _GeometricBackgroundState();
}
// ... (rest of the file)
// I will just add the import at the top and fix the deprecated calls in a multi_replace


class _GeometricBackgroundState extends State<GeometricBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Base gradient
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFF000000), // Pure Black
                Color(0xFF121212), // Very Dark Grey
                Color(0xFF1C1C1C), // Dark Grey
              ],
            ),
          ),
        ),

        // Animated Shapes
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              children: [
                // Circle 1 (Dark Grey)
                Positioned(
                  top: -50 + (_controller.value * 20),
                  left: -50 + (_controller.value * 10),
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[900]!.withValues(alpha: 0.5),
                    ),
                  ),
                ),
                // Circle 2 (Batman Yellow)
                Positioned(
                  bottom: 100 - (_controller.value * 30),
                  right: -20 + (_controller.value * 20),
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFFFFD700).withValues(alpha: 0.15), // Yellow
                    ),
                  ),
                ),
                // Square (Darker Grey)
                Positioned(
                  top: 200 + (_controller.value * 50),
                  right: 50 - (_controller.value * 10),
                  child: Transform.rotate(
                    angle: _controller.value * 2 * 3.14,
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.grey[800]!.withValues(alpha: 0.3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),

        // Blur over background to blend shapes
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(color: Colors.transparent),
        ),

        // Content
        Positioned.fill(child: widget.child),
      ],
    );
  }
}
