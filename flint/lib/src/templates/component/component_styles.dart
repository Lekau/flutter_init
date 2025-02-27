import 'package:flutter/material.dart';

class COMPONENT_NAMEStyles {
  static const TextStyle titleStyle = TextStyle(
    fontSize: 18, 
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  static const EdgeInsets padding = EdgeInsets.all(16.0);
  
  static final BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(8.0),
    boxShadow: [
      BoxShadow(
        color: Colors.black26,
        blurRadius: 4.0,
        offset: Offset(0, 2),
      ),
    ],
  );
} 