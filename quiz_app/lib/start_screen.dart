import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFFFEC412),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CIT-U school logo
            Image.asset(
              'assets/school.png',
              width: 200,
            ),

            const SizedBox(height: 20),

            // Quiz logo
            Image.asset(
              'assets/logo.png',
              width: 180,
            ),

            const SizedBox(height: 25),

            Text(
              'CIT-U QUIZ',
              style: GoogleFonts.lato(
                color: const Color(0xFF800020),
                fontSize: 32,
                fontWeight: FontWeight.w900,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              'Test Your Knowledge',
              style: GoogleFonts.lato(
                color: const Color(0xFF800020),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: startQuiz,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF800020),
                foregroundColor: const Color(0xFFFEC412),
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              icon: const Icon(Icons.play_arrow),
              label: const Text(
                'START QUIZ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              'Cebu Institute of Technology – University',
              style: TextStyle(
                color: Color(0xFF800020),
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}