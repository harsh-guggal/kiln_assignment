import 'package:flutter/material.dart';

class SocialCircle extends StatelessWidget {
  const SocialCircle({super.key, required this.img});
  final String img;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        // color: Color.fromRGBO(52, 52, 52, 1),
        border: Border.all(
          width: 2,
          color: const Color.fromRGBO(52, 52, 52, 1),
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/$img',
          color: const Color.fromRGBO(165, 165, 165, 1),
          width: 20,
          height: 20,
        ),
      ),
    );
  }
}
