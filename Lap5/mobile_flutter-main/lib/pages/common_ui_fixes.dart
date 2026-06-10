import 'package:flutter/material.dart';

class CommonUiFixes extends StatelessWidget {
  const CommonUiFixes({super.key});

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
          'Exercise 5 – Common Ui Fixes',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF3F0F5),
        elevation: 0,
      ),
      body: Column(
        children: [
          Text(
            "Correct ListView inside Column using Expanded",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemExtent: 30,
              itemCount: 20,
              itemBuilder: (context, index) {
                return Row(
                  spacing: 12,
                  children: [Icon(Icons.movie), Text("Movie A")],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
