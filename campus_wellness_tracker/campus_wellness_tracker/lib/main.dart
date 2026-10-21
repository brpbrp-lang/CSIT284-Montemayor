
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const CampusWellnessApp());
}

class CampusWellnessApp extends StatefulWidget {
  const CampusWellnessApp({super.key});

  @override
  State<CampusWellnessApp> createState() =>
      _CampusWellnessAppState();
}

class _CampusWellnessAppState extends State<CampusWellnessApp> {
  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Wellness Tracker',
      debugShowCheckedModeBanner: false,
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF246B50),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF6F8F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFF6F8F5),
          foregroundColor: Color(0xFF246B50),
        ),
        cardTheme: CardThemeData(
          color: Colors.white,
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF246B50),
            foregroundColor: Colors.white,
            minimumSize: const Size(double.infinity, 52),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF246B50),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF246B50),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFF333333),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFF666666),
          ),
        ),
      ),

      darkTheme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFF81C9A8),
          onPrimary: Color(0xFF121A16),
          secondary: Color(0xFFB2DFC5),
          surface: Color(0xFF202B25),
          onSurface: Color(0xFFF1F5F2),
        ),
        scaffoldBackgroundColor: const Color(0xFF121A16),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121A16),
          foregroundColor: Color(0xFF81C9A8),
        ),
        cardTheme: CardThemeData(
          color: const Color(0xFF202B25),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF81C9A8),
            foregroundColor: const Color(0xFF121A16),
            minimumSize: const Size(double.infinity, 52),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF81C9A8),
          ),
          headlineMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF81C9A8),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Color(0xFFF1F5F2),
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Color(0xFFCFD8D2),
          ),
        ),
      ),

      home: HomeScreen(
        isDarkMode: isDarkMode,
        onThemeChanged: toggleTheme,
      ),
    );
  }
}
