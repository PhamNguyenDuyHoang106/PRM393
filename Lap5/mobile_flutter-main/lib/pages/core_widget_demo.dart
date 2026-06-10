import 'package:flutter/material.dart';

class CoreWidget extends StatelessWidget {
  const CoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Exercise 1 – Core Widget Demo',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF3F0F5),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          children: [
            Text(
              "Welcome to Flutter UI",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            Icon(Icons.movie, color: Colors.lightBlueAccent, size: 80),
            Image.network(
              "https://imgv3.fotor.com/images/videoImage/wonderland-girl-generated-by-Fotor-ai-art-generator.jpg",
            ),
            Card(
              margin: EdgeInsets.all(12),
              child: ListTile(
                leading: Icon(Icons.star),
                title: Text('Movie Item'),
                subtitle: Text('This is a sample ListTile inside a Card'),
                onTap: () {
                  print('Tapped');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
