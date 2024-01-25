import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({
    super.key,
    this.left,
    this.right,
    this.bottom,
    this.top,
    required this.size,
  });

  final double? left;
  final double? right;
  final double? bottom;
  final double? top;

  final double size;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.purple.withOpacity(0.7),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
