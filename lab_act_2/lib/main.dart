import 'package:flutter/material.dart';
import 'package:flutter_application_1/dice_roller.dart';

 
 
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.green,
              Colors.white,
              Colors.red
            ])
          ),
          child: Center(
            child: DiceRoller()
            ),
        ),
      ),
    ),
  );
}