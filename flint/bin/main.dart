import 'dart:io';
import 'package:args/args.dart';
import 'package:flint/src/command/add_command.dart';

void main(List<String> arguments) async {
  final parser = ArgParser();
  
  // Define the 'add' command separately
  final addCommandParser = ArgParser()
    ..addOption('component', 
        abbr: 'c',
        help: 'Component name',
        mandatory: true); // Makes component required
  
  // Add the command to main parser
  parser.addCommand('add', addCommandParser);

  try {
    final result = parser.parse(arguments);
    
    if (result.command?.name == 'add') {
      // Access the component option value
      final component = result.command!['component'] as String;
      await AddCommand().run(component);
    } else {
      print('Usage: flint add --component <component-name>');
      print('Available commands:');
      print('  add    Add a new component');
    }
  } catch (e) {
    print('Error: $e');
    print('Usage: flint add --component <component-name>');
    exit(1);
  }
}