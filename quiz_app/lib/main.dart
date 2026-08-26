import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 72, 0, 144)
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/logo.png',
                  width: 250,
                ),
                SizedBox(height: 40),
                Text(
                  "Learn Flutter the fun way!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 30),
                OutlinedButton(
                  onPressed: () {},
                  child: Text(
                    "Start Quiz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900
                    ),
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

