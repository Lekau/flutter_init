import 'package:yaml/yaml.dart';

void checkDependencies() {
  final pubspec = File('pubspec.yaml').readAsStringSync();
  final doc = loadYaml(pubspec);
  final deps = doc['dependencies'] as Map? ?? {};

  if (!deps.containsKey('flutter_svg')) {
    print('Add flutter_svg to your pubspec.yaml');
  }
}