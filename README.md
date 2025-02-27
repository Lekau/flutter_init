# Flint 🔥

A flexible CLI tool for Flutter component generation

Flint helps Flutter developers accelerate their development by generating reusable UI components from templates. Quickly add buttons, cards, and other UI elements to your project without starting from scratch.

## ✨ Current Features

- **Component Generation** – Easily add pre-designed UI components to your Flutter projects
- **Multiple Component Types** – Currently supports:
  - Buttons (`--button`)
  - Cards (`--card`)
- **Customizable Templates** – All generated components maintain a consistent structure with separate template and styles files
- **Automatic File Naming** – Components are automatically named based on your input

## 📦 Installation

You can install Flint globally using Dart:

```bash
# From the flint directory
dart pub global activate --source path .
```

## 🔥 Usage

### Adding Components

To add a button component:

```bash
flint add component --button login_button
```

To add a card component:

```bash
flint add component --card user_profile
```

Each command will:
1. Create a directory for your component in `lib/components/<component_name>/`
2. Generate appropriate files based on the component type
3. Replace placeholder names with your component name

### Getting Help

```bash
flint --help
```

## 🧩 Component Structure

Components are organized with a consistent structure:

- `<component_name>_template.dart` - The main component implementation
- `<component_name>_styles.dart` - Styling constants for the component
- `<component_name>_example.dart` - Example usage of the component

## 🛠️ Extending Flint

New component types can be added by:
1. Creating a template directory in `lib/src/templates/components/<type>/`
2. Adding template files with appropriate naming (`<type>_template.dart`, etc.)
3. Updating the CLI parser in `main.dart` to include the new component type flag

## 🔮 Future Plans

- Support for more component types (forms, dialogs, etc.)
- Complete application templates
- Custom theme integration
- State management scaffolding

## 🤝 Contributing

Flint is open-source and under active development. Contributions, feedback, and feature requests are welcome!

Made with ❤️ for Flutter developers.