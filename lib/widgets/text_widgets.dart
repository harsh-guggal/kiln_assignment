import 'dart:ui';

import 'package:flutter/material.dart';

class Heading1 extends StatelessWidget {
  const Heading1({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontVariations: [FontVariation('wght', 600)],
        color: Colors.black,
      ),
    );
  }
}

class Heading2 extends StatelessWidget {
  const Heading2({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontVariations: [FontVariation('wght', 400)],
        color: Colors.black,
      ),
    );
  }
}
