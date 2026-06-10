import 'package:flutter/material.dart';

class AppStructure extends StatefulWidget {
  const AppStructure({super.key});

  @override
  State<AppStructure> createState() => _AppStructureState();
}

class _AppStructureState extends State<AppStructure> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      home: AppStructureBody(
        isDark: isDark,
        onToggle: (value) {
          setState(() {
            isDark = value;
          });
        },
      ),
    );
  }
}

class AppStructureBody extends StatelessWidget {
  final bool isDark;
  final Function(bool) onToggle;

  const AppStructureBody({
    super.key,
    required this.isDark,
    required this.onToggle,
  });

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
        actions: [
          Text(isDark ? "Dark" : "Light"),
          Switch(
            value: isDark,
            onChanged: (value) {
              onToggle(value);
            },
          ),
        ],
        title: const Text(
          'Exercise 4 – App Structure',
          style: TextStyle(fontSize: 20),
        ),
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 40),
        alignment: Alignment.bottomCenter,
        child: Text("This is a simple screen with theme toggle"),
      ),
    );
  }
}
