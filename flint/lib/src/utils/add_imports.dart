void addImport(String filePath, String importStatement) {
  final file = File(filePath);
  if (!file.existsSync()) return;

  final content = file.readAsStringSync();
  if (!content.contains(importStatement)) {
    file.writeAsStringSync('$importStatement\n$content');
  }
}