import 'dart:io';
import 'package:path/path.dart' as path;

class AddCommand {
  Future<void> run(String componentName) async {
    try {
      final projectDir = Directory.current;
      final targetLibDir = Directory(path.join(projectDir.path, 'lib'));

      if (!await targetLibDir.exists()) {
        throw Exception('No lib/ directory found. Are you in a Flutter project?');
      }

      final targetFile = File(path.join(targetLibDir.path, '${componentName.toLowerCase()}.dart'));
      await targetFile.parent.create(recursive: true);

      final templateContent = '''
import 'package:flutter/material.dart';

class $componentName extends StatelessWidget {
  const $componentName({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Hello from $componentName!');
  }
}
''';

      await targetFile.writeAsString(templateContent);
      print('Created ${targetFile.path}');
    } catch (e) {
      print('Error: $e');
      print('Usage: flint add --component <component-name>');
      exit(1);
    }
  }
}