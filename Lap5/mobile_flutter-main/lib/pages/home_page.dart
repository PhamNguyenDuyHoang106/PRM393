import 'package:flutter/material.dart';
import 'package:exam/entities/ui/ExerciseCard.dart';
import 'package:exam/pages/app_structure.dart';
import 'package:exam/pages/common_ui_fixes.dart';
import 'package:exam/pages/core_widget_demo.dart';
import 'package:exam/pages/input_controls_demo.dart';
import 'package:exam/pages/layout_demo.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> exercises = [
      {
        "title": "Exercise 1",
        "description": "Core Widgets Demo",
        "page": const CoreWidget(),
      },
      {
        "title": "Exercise 2",
        "description": "Input Control Demo",
        "page": const InputControlsDemo(),
      },
      {
        "title": "Exercise 3",
        "description": "Layout Demo",
        "page": const LayoutDemo(),
      },
      {
        "title": "Exercise 4",
        "description": "App Structure & Theme",
        "page": const AppStructure(),
      },
      {
        "title": "Exercise 5",
        "description": "Common UI Fixes",
        "page": const CommonUiFixes(),
      },
    ];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(12),
          child: const Text(
            "Lab 4 - Flutter UI Fundamentals",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
            ),
          ),
        ),
        Flexible(
          child: ListView.separated(
            padding: const EdgeInsets.all(12),
            itemCount: exercises.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return ExerciseCard(
                title: exercises[index]['title']!,
                description: exercises[index]['description']!,
                page: exercises[index]['page']!,
              );
            },
          ),
        ),
      ],
    );
  }
}
