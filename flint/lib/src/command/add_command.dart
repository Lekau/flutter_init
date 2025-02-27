import 'dart:io';
import 'package:path/path.dart' as path;

class AddCommand {
  Future<void> run(String componentType, String componentName) async {
    print("DEBUG: Running AddCommand with componentType: $componentType and componentName: $componentName");
    
    try {
      final projectDir = Directory.current;
      final targetLibDir = Directory(path.join(projectDir.path, 'lib'));

      if (!await targetLibDir.exists()) {
        throw Exception('No lib/ directory found. Are you in a Flutter project?');
      }

      final componentsDir = Directory(path.join(targetLibDir.path, 'components', componentName.toLowerCase()));
      await componentsDir.create(recursive: true);

      final templatesDir = await _findTemplatesDir(componentType);
      print('DEBUG: Templates directory: $templatesDir');
      
      final templatesDirObj = Directory(templatesDir);
      if (!await templatesDirObj.exists()) {
        throw Exception('Component type "$componentType" not found. Available types: ${await _getAvailableComponentTypes()}');
      }

      print('Copying $componentType templates from: $templatesDir');
      print('Target directory: ${componentsDir.path}');
      
      final templateFiles = await templatesDirObj.list().toList();
      
      if (templateFiles.isEmpty) {
        print('Warning: No template files found in $templatesDir');
      }

      int filesCreated = 0;
      
      for (var entity in templateFiles) {
        if (entity is File) {
          final fileName = path.basename(entity.path);
          
          final destFileName = fileName.replaceAll('${componentType}_', '${componentName.toLowerCase()}_');
          final destFile = File(path.join(componentsDir.path, destFileName));
          
          String content = await entity.readAsString();
          
          content = content.replaceAll('COMPONENT_NAME', _capitalizeComponentName(componentName));
          
          await destFile.writeAsString(content);
          
          print('Created ${destFile.path}');
          filesCreated++;
        }
      }
      
      print('$componentType component created successfully! Created $filesCreated files.');
    } catch (e) {
      print('Error: $e');
      print('Usage: flint add component --<type> <component-name>');
      exit(1);
    }
  }
  
 
  Future<String> _findTemplatesDir(String componentType) async {
   
    
  
    String? templatesDir;
    try {
      final scriptDir = Platform.script.toFilePath();
      print('DEBUG: Script directory: $scriptDir');
      
      if (scriptDir.endsWith('bin/main.dart') || scriptDir.endsWith('bin/flint.dart')) {
        
        final packageDir = path.dirname(path.dirname(scriptDir)); 
        templatesDir = path.join(packageDir, 'lib', 'src', 'templates', 'components', componentType);
      } else {
        final packageRootDir = path.dirname(path.dirname(path.dirname(scriptDir)));
        templatesDir = path.join(packageRootDir, 'lib', 'src', 'templates', 'components', componentType);
      }
      

      if (await Directory(templatesDir).exists()) {
        return templatesDir;
      }
    } catch (e) {
      print('DEBUG: Strategy 1 failed: $e');
    }
    
    try {
      final currentDir = Directory.current.path;
      print('DEBUG: Current directory: $currentDir');
      
      final testPath = path.join(currentDir, 'lib', 'src', 'templates', 'components', componentType);
      if (await Directory(testPath).exists()) {
        return testPath;
      }
      
      final flintProjectPath = '/Users/lekau/Developer/flutter_init/flint';
      final hardcodedPath = path.join(flintProjectPath, 'lib', 'src', 'templates', 'components', componentType);
      if (await Directory(hardcodedPath).exists()) {
        return hardcodedPath;
      }
    } catch (e) {
      print('DEBUG: Strategy 2 failed: $e');
    }
    
    try {
      Directory current = Directory.current;
      for (int i = 0; i < 5; i++) { 
        print('DEBUG: Checking directory: ${current.path}');
        final testPath = path.join(current.path, 'lib', 'src', 'templates', 'components', componentType);
        if (await Directory(testPath).exists()) {
          return testPath;
        }
        
        String parentPath = path.dirname(current.path);
        if (parentPath == current.path) break; 
        current = Directory(parentPath);
      }
    } catch (e) {
      print('DEBUG: Strategy 3 failed: $e');
    }
    
    return path.join('/Users/lekau/Developer/flutter_init/flint', 'lib', 'src', 'templates', 'components', componentType);
  }
  
  Future<List<String>> _getAvailableComponentTypes() async {
    try {
      String? componentsDir;
      
      try {
        final scriptDir = Platform.script.toFilePath();
        if (scriptDir.endsWith('bin/main.dart') || scriptDir.endsWith('bin/flint.dart')) {
          final packageDir = path.dirname(path.dirname(scriptDir));
          componentsDir = path.join(packageDir, 'lib', 'src', 'templates', 'components');
        } else {
          final packageRootDir = path.dirname(path.dirname(path.dirname(scriptDir)));
          componentsDir = path.join(packageRootDir, 'lib', 'src', 'templates', 'components');
        }
        
        if (await Directory(componentsDir).exists()) {
          return await _getDirectoryNames(componentsDir);
        }
      } catch (e) {
        print('DEBUG: Failed to find components directory based on script location: $e');
      }
      
      componentsDir = '/Users/lekau/Developer/flutter_init/flint/lib/src/templates/components';
      if (await Directory(componentsDir).exists()) {
        return await _getDirectoryNames(componentsDir);
      }
      
      return ['button', 'card']; 
    } catch (e) {
      print('DEBUG: Error finding component types: $e');
      return [];
    }
  }
  
  Future<List<String>> _getDirectoryNames(String dirPath) async {
    final dir = Directory(dirPath);
    if (!await dir.exists()) {
      return [];
    }
    
    return await dir.list()
        .where((entity) => entity is Directory)
        .map((entity) => path.basename(entity.path))
        .toList();
  }
  
  String _capitalizeComponentName(String name) {
    return name.split('_').map((part) => 
      part.isEmpty ? '' : '${part[0].toUpperCase()}${part.substring(1).toLowerCase()}')
      .join('');
  }
}