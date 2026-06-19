import 'package:flutter/material.dart';

void main() {
  runApp(const PebloApp());
}

class PebloApp extends StatelessWidget {
  const PebloApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peblo Story Buddy',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: Scaffold(
        backgroundColor: const Color(0xFFFFF8E7),
        appBar: AppBar(
          title: const Text('Peblo Story Buddy'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text(
            'Peblo Challenge',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}