
import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String answerText;
  final VoidCallback onTap;

  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark =
        Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;

    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: Theme.of(context).cardTheme.color,
          side: BorderSide(
            color: dark
                ? const Color(0xFF52665A)
                : const Color(0xFFD1DED4),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 18,
          ),
          alignment: Alignment.centerLeft,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                answerText,
                style: TextStyle(
                  fontSize: 15,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
