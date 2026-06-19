import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants/app_constants.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool showWrongMessage = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0,
      end: 12,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.elasticIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void checkAnswer(String option) async {
    bool isCorrect =
        option == AppConstants.quizData["answer"];

    if (isCorrect) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ResultScreen(
            isCorrect: true,
            score: 1,
          ),
        ),
      );
    } else {
      HapticFeedback.mediumImpact();

      setState(() {
        showWrongMessage = true;
      });

      await _controller.forward();
      await _controller.reverse();

      Future.delayed(
        const Duration(seconds: 2),
        () {
          if (mounted) {
            setState(() {
              showWrongMessage = false;
            });
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<String> options =
        List<String>.from(AppConstants.quizData["options"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Time"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(
                _animation.value,
                0,
              ),
              child: child,
            );
          },
          child: Column(
            children: [
              Text(
                AppConstants.quizData["question"],
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 15),

              if (showWrongMessage)
                const Text(
                  "❌ Try Again!",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

              const SizedBox(height: 15),

              ...options.map(
                (option) => Padding(
                  padding: const EdgeInsets.only(
                    bottom: 12,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding:
                            const EdgeInsets.symmetric(
                          vertical: 16,
                        ),
                      ),
                      onPressed: () =>
                          checkAnswer(option),
                      child: Text(
                        option,
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}