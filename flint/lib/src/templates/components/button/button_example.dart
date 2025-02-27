import 'package:flutter/material.dart';
import 'button_template.dart';
import 'button_styles.dart';

class COMPONENT_NAMEButtonExample extends StatefulWidget {
  const COMPONENT_NAMEButtonExample({super.key});

  @override
  State<COMPONENT_NAMEButtonExample> createState() => _COMPONENT_NAMEButtonExampleState();
}

class _COMPONENT_NAMEButtonExampleState extends State<COMPONENT_NAMEButtonExample> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COMPONENT_NAME Button Examples'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              COMPONENT_NAMEButton(
                text: 'Primary Button',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Primary button pressed')),
                  );
                },
              ),
              const SizedBox(height: 16),
              COMPONENT_NAMEButton(
                text: 'Secondary Button',
                style: COMPONENT_NAMEButtonStyles.secondaryButtonStyle,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Secondary button pressed')),
                  );
                },
              ),
              const SizedBox(height: 16),
              COMPONENT_NAMEButton(
                text: 'Success Button',
                style: COMPONENT_NAMEButtonStyles.successButtonStyle,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Success button pressed')),
                  );
                },
              ),
              const SizedBox(height: 16),
              COMPONENT_NAMEButton(
                text: 'Danger Button',
                style: COMPONENT_NAMEButtonStyles.dangerButtonStyle,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Danger button pressed')),
                  );
                },
              ),
              const SizedBox(height: 16),
              COMPONENT_NAMEButton(
                text: 'Button with Icon',
                icon: Icons.favorite,
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Icon button pressed')),
                  );
                },
              ),
              const SizedBox(height: 16),
              COMPONENT_NAMEButton(
                text: _isLoading ? 'Loading...' : 'Loading Button',
                isLoading: _isLoading,
                onPressed: () {
                  setState(() {
                    _isLoading = true;
                  });
                  
                  Future.delayed(const Duration(seconds: 2), () {
                    if (mounted) {
                      setState(() {
                        _isLoading = false;
                      });
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Loading completed')),
                      );
                    }
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
} 