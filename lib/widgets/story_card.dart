import 'package:flutter/material.dart';

class StoryCard extends StatelessWidget {
  final String title;

  const StoryCard({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, 
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Tap below to hear the story",
            ),
          ],
        ),
      ),
    );
  }
}