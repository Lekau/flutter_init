import 'dart:io';
import 'package:args/args.dart';
import 'package:flint/src/command/add_command.dart';

void main(List<String> arguments) async {
  print("===== FLINT CLI v0.2 DEBUG =====");
  print("Arguments received: $arguments");
  
  final parser = ArgParser();
  
  parser.addFlag('help', abbr: 'h', negatable: false, help: 'Print this usage information.');
  
  final addCommandParser = ArgParser();
  
  final componentCommandParser = ArgParser();
  
  componentCommandParser.addFlag('button', negatable: false, help: 'Create a button component');
  componentCommandParser.addFlag('card', negatable: false, help: 'Create a card component');
  componentCommandParser.addFlag('form', negatable: false, help: 'Create a form component');
  
  addCommandParser.addCommand('component', componentCommandParser);
  
  parser.addCommand('add', addCommandParser);

  try {
    final result = parser.parse(arguments);
    
    if (result['help'] == true) {
      _printUsage();
      return;
    }
    
    if (result.command?.name == 'add') {
      final addResult = result.command;
      
      if (addResult?.command?.name == 'component') {
        final componentArgs = addResult!.command!;
        final componentOptions = componentArgs.options.where(componentArgs.wasParsed).toList();
        
        if (componentOptions.isEmpty) {
          throw FormatException('Component type is required. Use one of: --button, --card');
        }
        
        if (componentOptions.length > 1) {
          throw FormatException('Only one component type can be specified at a time');
        }
        
        final componentType = componentOptions.first;
        final rest = componentArgs.rest;
        
        if (rest.isEmpty) {
          throw FormatException('Component name is required');
        }
        
        final componentName = rest.first;
        await AddCommand().run(componentType, componentName);
      } else {
        print('Unknown add subcommand. Available: component');
        print('Usage: flint add component --<type> <component-name>');
        print('Example: flint add component --button primary_button');
      }
    } else {
      _printUsage();
    }
  } catch (e) {
    print('Error: $e');
    _printUsage();
    exit(1);
  }
}

void _printUsage() {
  print('Usage: flint <command> [arguments]');
  print('');
  print('Global options:');
  print('  -h, --help    Print this usage information');
  print('');
  print('Available commands:');
  print('  add           Add a component to your Flutter project');
  print('');
  print('add command usage:');
  print('  flint add component --<type> <component-name>');
  print('');
  print('Examples:');
  print('  flint add component --button primary_button');
  print('  flint add component --card user_profile');
}