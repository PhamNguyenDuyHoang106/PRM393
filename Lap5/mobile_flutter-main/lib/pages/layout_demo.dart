import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  const LayoutDemo({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> movies = [
      {"title": "Avatar", "description": "Sample description"},
      {"title": "Inception", "description": "Sample description"},
      {"title": "Interstellar", "description": "Sample description"},
      {"title": "Joker", "description": "Sample description"},
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Exercise 3 – Layout Demo',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF3F0F5),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.all(12),
        child: Column(
          children: [
            const Text(
              "Now Playing",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: const Color(0xffdfe0ff),
                        child: Text(
                          "${movies[index]["title"].substring(0, 1)}",
                        ),
                      ),
                      title: Text(movies[index]["title"]),
                      subtitle: Text(movies[index]["description"]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
