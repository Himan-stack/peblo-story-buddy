import 'package:flutter/material.dart';
import '../constants/app_constants.dart';
import '../widgets/ai_buddy.dart';
import '../widgets/story_card.dart';
import '../services/tts_service.dart';
import 'quiz_screen.dart';
import 'package:provider/provider.dart';
import '../providers/story_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TtsService ttsService = TtsService();

  

  Future<void> playStory() async {
   final provider =
      Provider.of<StoryProvider>(
        context,
        listen: false,
      );

    try {
      provider.startLoading();

      await Future.delayed(
        const Duration(seconds: 1),
      );

    await ttsService.speak(
      AppConstants.storyText,
      onComplete: () {
        if (mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const QuizScreen(),
            ),
          );
        }
      },
    );

    provider.stopLoading();
  } catch (e) {
    provider.stopLoading();

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Oops! Couldn't play the story. Please try again.",
          ),
        ),
      );
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peblo Story Buddy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),

            const AiBuddy(),

            const SizedBox(height: 20),

            const StoryCard(
              title: AppConstants.storyTitle,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
              ),
              onPressed: context.watch<StoryProvider>().isLoading
                  ? null
                  : playStory,
              child: context.watch<StoryProvider>().isLoading
                  ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 18,
                          width: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text("Preparing Story..."),
                      ],
                    )
                  : const Text(
                      "Read Me A Story",
                    ),
            ),

            const SizedBox(height: 20),

            const Text(
              "Built with Flutter & TTS",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}