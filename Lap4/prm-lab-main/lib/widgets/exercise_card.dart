import 'package:flutter/material.dart';

class ExerciseCard extends StatelessWidget {
  final String title;
  final String description;
  final Widget page;

  const ExerciseCard({
    super.key,
    required this.title,
    required this.description,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xffF5F2F9),
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "$title - $description",
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
              const SizedBox(width: 12),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.black54,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
