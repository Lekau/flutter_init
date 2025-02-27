import 'package:flutter/material.dart';

class COMPONENT_NAMECardStyles {
  // Card styling
  static final BoxDecoration cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(12.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black12,
        blurRadius: 6.0,
        offset: const Offset(0, 3),
      ),
    ],
  );
  
  // Text styling
  static const TextStyle titleStyle = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );
  
  static const TextStyle descriptionStyle = TextStyle(
    fontSize: 14.0,
    color: Colors.black54,
    height: 1.3,
  );
  
  // Button styling
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  static final ButtonStyle secondaryButtonStyle = TextButton.styleFrom(
    foregroundColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  );
  
  // Spacing constants
  static const double cardPadding = 16.0;
  static const double contentSpacing = 12.0;
  static const double buttonSpacing = 8.0;
} 