
import 'package:flutter/material.dart';

class ResultView extends StatelessWidget {
  final int totalScore;
  final String wellnessLevel;
  final String recommendation;
  final Color wellnessColor;

  const ResultView({
    super.key,
    required this.totalScore,
    required this.wellnessLevel,
    required this.recommendation,
    required this.wellnessColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark =
        Theme.of(context).brightness == Brightness.dark;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final secondaryTextColor =
        dark ? Colors.white70 : const Color(0xFF666666);
    final primaryColor = Theme.of(context).colorScheme.primary;

    final scoreProgress =
        (totalScore / 20).clamp(0.0, 1.0).toDouble();

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Wellness Score',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              '$totalScore / 20',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 42,
                fontWeight: FontWeight.bold,
                color: wellnessColor,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: scoreProgress,
              minHeight: 10,
              borderRadius: BorderRadius.circular(8),
              backgroundColor: dark
                  ? const Color(0xFF34433A)
                  : const Color(0xFFDCE8DF),
              color: wellnessColor,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: dark
                    ? const Color(0xFF2A3930)
                    : const Color(0xFFE8F2EA),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.favorite_rounded,
                    size: 32,
                    color: wellnessColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    wellnessLevel,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: wellnessColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Recommendation',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              recommendation,
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: textColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Keep taking small steps toward a healthier daily routine.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: secondaryTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
