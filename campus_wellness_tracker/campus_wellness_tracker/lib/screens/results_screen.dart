
import 'package:flutter/material.dart';

import 'assessment_screen.dart';
import '../widgets/result_view.dart';

class ResultsScreen extends StatelessWidget {
  final int totalScore;
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const ResultsScreen({
    super.key,
    required this.totalScore,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  String get wellnessLevel {
    if (totalScore >= 17) {
      return 'Excellent Wellness';
    } else if (totalScore >= 13) {
      return 'Good Wellness';
    } else if (totalScore >= 9) {
      return 'Fair Wellness';
    } else {
      return 'Needs Improvement';
    }
  }

  String get recommendation {
    if (totalScore >= 17) {
      return 'Great job! Keep maintaining healthy habits, getting enough sleep, staying hydrated, and making time for yourself.';
    } else if (totalScore >= 13) {
      return 'You are building good habits. Continue being active, drinking enough water, and balancing schoolwork with rest.';
    } else if (totalScore >= 9) {
      return 'Try improving one habit at a time. Start with a consistent sleep schedule, regular water breaks, and short physical activities.';
    } else {
      return 'Consider making small, manageable changes to your daily routine. Prioritize rest, hydration, movement, and healthy ways to manage academic stress.';
    }
  }

  Color get wellnessColor {
    if (totalScore >= 17) {
      return const Color(0xFF246B50);
    } else if (totalScore >= 13) {
      return const Color(0xFF4F8A5B);
    } else if (totalScore >= 9) {
      return const Color(0xFFE09F3E);
    } else {
      return const Color(0xFFC94C4C);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark =
        Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final secondaryTextColor =
        dark ? Colors.white70 : const Color(0xFF666666);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Wellness Results'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            tooltip: dark ? 'Switch to light mode' : 'Switch to dark mode',
            onPressed: onThemeChanged,
            icon: Icon(
              dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 600),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Icon(
                    Icons.health_and_safety_rounded,
                    size: 76,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Assessment Complete!',
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge
                        ?.copyWith(color: primaryColor),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Here is a summary of your daily wellness check-in.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 28),
                  ResultView(
                    totalScore: totalScore,
                    wellnessLevel: wellnessLevel,
                    recommendation: recommendation,
                    wellnessColor: dark && totalScore >= 17
                        ? const Color(0xFF81C9A8)
                        : wellnessColor,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => AssessmentScreen(
                            isDarkMode: dark,
                            onThemeChanged: onThemeChanged,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.refresh_rounded),
                    label: const Text('Restart Assessment'),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).popUntil(
                        (route) => route.isFirst,
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: primaryColor,
                      side: BorderSide(color: primaryColor),
                    ),
                    icon: const Icon(Icons.home_rounded),
                    label: const Text('Back to Home'),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Your result is a self-reflection guide, not a medical diagnosis.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: secondaryTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
