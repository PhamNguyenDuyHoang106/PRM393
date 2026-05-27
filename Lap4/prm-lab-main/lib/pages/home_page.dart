import 'package:flutter/material.dart';
import '../widgets/exercise_card.dart';
import 'core_widget_demo.dart';
import 'input_widgets_page.dart';
import 'layout_page.dart';
import 'scaffold_page.dart';
import 'theme_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Lab 4 Exercises')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ExerciseCard(
            title: 'Exercise 1 - Core Widgets',
            description: 'Text, Image, Icon, Card, ListTile',
            page: CoreWidgetsPage(),
          ),
          SizedBox(height: 12),
          ExerciseCard(
            title: 'Exercise 2 - Input Widgets',
            description: 'Slider, Switch, RadioListTile, Pickers',
            page: InputWidgetsPage(),
          ),
          SizedBox(height: 12),
          ExerciseCard(
            title: 'Exercise 3 - Layout Composition',
            description: 'Column, Row, Padding, ListView',
            page: LayoutPage(),
          ),
          SizedBox(height: 12),
          ExerciseCard(
            title: 'Exercise 4 - Scaffold Structure',
            description: 'Scaffold, Drawer, BottomNavigationBar',
            page: ScaffoldPage(),
          ),
          SizedBox(height: 12),
          ExerciseCard(
            title: 'Exercise 5 - ThemeData',
            description: 'Applying themes and spacing',
            page: ThemePage(),
          ),
        ],
      ),
    );
  }
}