// custom_image_card.dart
import 'package:flutter/material.dart';

class CustomImageCard extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const CustomImageCard({
    super.key,
    required this.imagePath,
    this.width = 320,
    this.height = 346,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
