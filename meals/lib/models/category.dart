import 'package:flutter/material.dart';

import 'dart:ui';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromARGB(255, 206, 219, 82),
  });

  final String id;
  final String title;
  final Color color;
}
