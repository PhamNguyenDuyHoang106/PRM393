import 'package:flutter/material.dart';

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double rating = 50;
  bool isActive = false;
  String? selectedGenre;
  DateTime? selectedDate;

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

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
          'Exercise 2 – Input Control Demo',
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        backgroundColor: const Color(0xFFF3F0F5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Rating (Slider)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: rating,
              min: 0,
              max: 100,
              onChanged: (value) {
                setState(() {
                  rating = value;
                });
              },
            ),
            Text("Current value: ${rating.toInt()}"),
            const Text(
              "Active (Switch)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Is movie active?"),
                Switch(
                  value: isActive,
                  onChanged: (value) {
                    print(isActive);
                    setState(() {
                      isActive = !isActive;
                    });
                  },
                ),
              ],
            ),
            Text(
              "Genre (RadioListTile)",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RadioGroup(
              groupValue: selectedGenre,
              onChanged: (value) {
                setState(() {
                  selectedGenre = value;
                });
              },
              child: const Column(
                children: [
                  RadioListTile(title: Text("Action"), value: "Action"),
                  RadioListTile(title: Text("Comedy"), value: "Comedy"),
                ],
              ),
            ),
            Text("Selected genre: ${selectedGenre ?? "None"}"),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: pickDate,
                child: Text("Open Date Picker"),
              ),
            ),
            if (selectedDate != null) Text("Selected date: $selectedDate"),
          ],
        ),
      ),
    );
  }
}
