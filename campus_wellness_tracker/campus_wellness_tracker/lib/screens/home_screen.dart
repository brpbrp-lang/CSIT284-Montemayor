
import 'package:flutter/material.dart';
import 'assessment_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeChanged;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final dark =
        Theme.of(context).brightness == Brightness.dark;
    final primaryColor = Theme.of(context).colorScheme.primary;
    final textColor = Theme.of(context).colorScheme.onSurface;
    final secondaryTextColor =
        dark ? Colors.white70 : const Color(0xFF666666);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Wellness Tracker'),
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
        child: LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = constraints.maxWidth;
            final isWide = screenWidth >= 900;
            final isMedium = screenWidth >= 600;

            final contentWidth = isWide
                ? 1000.0
                : isMedium
                    ? 750.0
                    : 500.0;

            return Center(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isMedium ? 32 : 20),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: contentWidth,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      if (isWide)
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: _buildWelcome(
                                context,
                                primaryColor,
                                secondaryTextColor,
                                isMedium,
                              ),
                            ),
                            const SizedBox(width: 32),
                            Expanded(
                              child: _buildStudentCard(
                                context,
                                dark,
                                primaryColor,
                                textColor,
                                secondaryTextColor,
                              ),
                            ),
                          ],
                        )
                      else ...[
                        _buildWelcome(
                          context,
                          primaryColor,
                          secondaryTextColor,
                          isMedium,
                        ),
                        const SizedBox(height: 28),
                        _buildStudentCard(
                          context,
                          dark,
                          primaryColor,
                          textColor,
                          secondaryTextColor,
                        ),
                      ],
                      const SizedBox(height: 24),
                      _buildAssessmentCard(
                        context,
                        primaryColor,
                        textColor,
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AssessmentScreen(
                                isDarkMode: dark,
                                onThemeChanged: onThemeChanged,
                              ),
                            ),
                          );
                        },
                        icon: const Icon(Icons.play_arrow_rounded),
                        label: const Text('Start Assessment'),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Your wellness matters. Take a moment for yourself.',
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
            );
          },
        ),
      ),
    );
  }

  Widget _buildWelcome(
    BuildContext context,
    Color primaryColor,
    Color secondaryTextColor,
    bool isMedium,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.health_and_safety_rounded,
          size: isMedium ? 88 : 72,
          color: primaryColor,
        ),
        const SizedBox(height: 20),
        Text(
          'Take Care of Your Well-being',
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: primaryColor,
                fontSize: isMedium ? 32 : 28,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          'Check in with yourself, reflect on your daily habits, '
          'and discover simple ways to support your wellness '
          'as a student.',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: isMedium ? 17 : 15,
            height: 1.6,
            color: secondaryTextColor,
          ),
        ),
      ],
    );
  }

  Widget _buildStudentCard(
    BuildContext context,
    bool dark,
    Color primaryColor,
    Color textColor,
    Color secondaryTextColor,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            CircleAvatar(
              radius: 36,
              backgroundColor: dark
                  ? const Color(0xFF34483D)
                  : const Color(0xFFE1EEE5),
              child: Icon(
                Icons.person_rounded,
                size: 40,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'John Emmanuel B. Montemayor',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'BSIT - 3',
              style: TextStyle(
                fontSize: 15,
                color: secondaryTextColor,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Cebu Institute of Technology – University',
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

  Widget _buildAssessmentCard(
    BuildContext context,
    Color primaryColor,
    Color textColor,
  ) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About the Assessment',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Answer five questions about your daily wellness habits. '
              'Your results will provide a general self-reflection guide.',
              style: TextStyle(
                fontSize: 15,
                height: 1.6,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
