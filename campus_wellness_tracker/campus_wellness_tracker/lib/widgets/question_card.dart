
import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final int questionNumber;
  final int totalQuestions;

  const QuestionCard({
    super.key,
    required this.question,
    required this.questionNumber,
    required this.totalQuestions,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'QUESTION $questionNumber OF $totalQuestions',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              question,
              style: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w600,
                height: 1.4,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
