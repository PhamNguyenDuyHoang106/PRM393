import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Layout Composition')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Row Widget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: Container(height: 60, color: Colors.blue)),
                const SizedBox(width: 10),
                Expanded(child: Container(height: 60, color: Colors.green)),
                const SizedBox(width: 10),
                Expanded(child: Container(height: 60, color: Colors.red)),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Column Widget',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Container(height: 60, color: Colors.orange),
                const SizedBox(height: 10),
                Container(height: 60, color: Colors.purple),
                const SizedBox(height: 10),
                Container(height: 60, color: Colors.teal),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              'Padding Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 80,
                color: Colors.amber,
                child: const Center(
                  child: Text('This container has padding'),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              'ListView Example',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: const Icon(Icons.list),
                    title: Text('List Item ${index + 1}'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}