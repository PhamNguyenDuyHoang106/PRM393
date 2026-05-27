import 'package:flutter/material.dart';

class CoreWidgetsPage extends StatelessWidget {
  const CoreWidgetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Core Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Text Widget Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text('Flutter helps you build beautiful UIs quickly.'),
            const SizedBox(height: 20),
            Image.network(
              // Simple demo image URL to avoid invalid image data issues.
              'https://picsum.photos/800/300',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Text(
                'Failed to load image',
                style: TextStyle(color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.favorite, color: Colors.red, size: 40),
                Icon(Icons.star, color: Colors.amber, size: 40),
                Icon(Icons.thumb_up, color: Colors.blue, size: 40),
              ],
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Card Widget Example',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'This card demonstrates how Card widgets are used in Flutter.',
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('John Doe'),
                    subtitle: Text('Flutter Developer'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text('example@gmail.com'),
                    subtitle: Text('Email Address'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}