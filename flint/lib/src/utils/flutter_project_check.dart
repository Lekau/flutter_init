import 'dart:io';

 bool isFlutterProject() {
    return File('pubspec.yaml').existsSync();
  }