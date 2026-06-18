import 'package:flutter/material.dart';
import 'entities/ui/ResponsiveMovieApp.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveMovieApp();
  }
}
