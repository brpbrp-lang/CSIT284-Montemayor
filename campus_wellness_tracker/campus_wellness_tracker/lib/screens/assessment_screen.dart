
import 'package:flutter/material.dart';

import '../data/wellness_questions.dart';
import '../widgets/question_card.dart';
import '../widgets/answer_button.dart';
import 'results_screen.dart';

class AssessmentScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const AssessmentScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  State<AssessmentScreen> createState() =>
      _AssessmentScreenState();
}

class _AssessmentScreenState extends State<AssessmentScreen> {
  int currentQuestionIndex = 0;
  int totalScore = 0;

  void answerQuestion(int score) {
    totalScore += score;

    if (currentQuestionIndex < wellnessQuestions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            totalScore: totalScore,
            isDarkMode:
                Theme.of(context).brightness == Brightness.dark,
            onThemeChanged: widget.onThemeChanged,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = wellnessQuestions[currentQuestionIndex];
    final dark =
        Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;

    final secondaryTextColor =
        dark ? Colors.white70 : const Color(0xFF666666);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellness Assessment'),
        actions: [
          IconButton(
            tooltip: dark ? 'Switch to light mode' : 'Switch to dark mode',
            onPressed: widget.onThemeChanged,
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
              constraints: BoxConstraints(
                maxWidth:
                    MediaQuery.of(context).size.width >= 900
                        ? 750
                        : 600,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Daily Wellness Check-in',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Answer honestly based on how you feel today.',
                    style: TextStyle(
                      fontSize: 15,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  LinearProgressIndicator(
                    value: (currentQuestionIndex + 1) /
                        wellnessQuestions.length,
                    minHeight: 8,
                    borderRadius: BorderRadius.circular(8),
                    backgroundColor: dark
                        ? const Color(0xFF34433A)
                        : const Color(0xFFDCE8DF),
                    color: primaryColor,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Question ${currentQuestionIndex + 1} '
                    'of ${wellnessQuestions.length}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                      fontSize: 14,
                      color: secondaryTextColor,
                    ),
                  ),
                  const SizedBox(height: 24),
                  QuestionCard(
                    question: currentQuestion.question,
                    questionNumber: currentQuestionIndex + 1,
                    totalQuestions: wellnessQuestions.length,
                  ),
                  const SizedBox(height: 24),
                  ...currentQuestion.answers.map(
                    (answer) => Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: AnswerButton(
                        answerText: answer.text,
                        onTap: () => answerQuestion(answer.score),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Choose the answer that best describes you.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
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
