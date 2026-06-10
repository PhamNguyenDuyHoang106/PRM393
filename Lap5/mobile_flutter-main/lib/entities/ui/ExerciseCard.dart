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
    return FloatingActionButton(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      backgroundColor: Color(0xffF5F2F9),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Container(
        padding: EdgeInsets.all(12),
        child: Row(
          spacing: 12,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "$title - $description",
              style: TextStyle(color: Colors.black87),
            ),
            Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              size: 12,
            ),
          ],
        ),
      ),
    );
  }
}
