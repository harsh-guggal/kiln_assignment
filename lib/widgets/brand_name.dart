import 'package:flutter/material.dart';

class BrandName extends StatelessWidget {
  const BrandName({super.key});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => const LinearGradient(
        colors: [
          Colors.white,
          Colors.white,
          Colors.white,
          Color.fromRGBO(238, 160, 38, 1),
          Color.fromRGBO(233, 58, 39, 1)
        ],
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: const Text(
        'BRANDKILN',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
    );
  }
}
