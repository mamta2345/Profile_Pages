import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DecoratedInput extends StatelessWidget {
  final String hint;
  final String? value;
  final String? iconPath;
  final double iconSize;
  final Color? iconColor;

  const DecoratedInput({
    Key? key,
    required this.hint,
    this.value,
    this.iconPath,
    this.iconSize = 24,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        children: [
          Image.asset(
            iconPath!,
            width: iconSize,
            height: iconSize,
            color: iconColor,
          ),
          const SizedBox(width: 8),
          Text(
            (value == null || value!.isEmpty) ? hint : value!,
            style: GoogleFonts.poppins(
              color: (value == null || value!.isEmpty)
                  ? Colors.white54
                  : Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
