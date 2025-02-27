import 'package:flutter/material.dart';

class COMPONENT_NAMEButtonStyles {
  // Primary button style
  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 2,
  );
  
  // Secondary button style
  static final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.blue,
    backgroundColor: Colors.white,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: const BorderSide(color: Colors.blue),
    ),
    elevation: 0,
  );
  
  // Success button style
  static final ButtonStyle successButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 2,
  );
  
  // Danger button style
  static final ButtonStyle dangerButtonStyle = ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.red,
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 2,
  );
  
  // Text styles
  static const TextStyle buttonTextStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
} 