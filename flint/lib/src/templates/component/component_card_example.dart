import 'package:flutter/material.dart';
import 'COMPONENT_NAME_card.dart';

class COMPONENT_NAMECardExample extends StatelessWidget {
  const COMPONENT_NAMECardExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('COMPONENT_NAME Card Example'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            COMPONENT_NAMECard(
              title: 'My First COMPONENT_NAME Card',
              description: 'This is an example of the COMPONENT_NAME card with an image',
              imageUrl: 'https://picsum.photos/seed/picsum/600/400',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Card tapped!')),
                );
              },
            ),
            const SizedBox(height: 24),
            COMPONENT_NAMECard(
              title: 'Another COMPONENT_NAME Card',
              description: 'This card has no image but shows how versatile the component is',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Second card tapped!')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
} 