import 'package:flutter/material.dart';

class AppGradients {
  static LinearGradient get primaryGradient => const LinearGradient(
        begin: Alignment.topCenter, // Start at the top
        end: Alignment.bottomCenter, // End at the bottom
        colors: [
          Color(0xFF21126D), // Starting color
          Color(0xFF1E183D), // Ending color
        ],
      );
}
