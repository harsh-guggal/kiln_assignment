import 'package:flutter/material.dart';
import 'package:guggal_social/utils/brand_colors.dart';

class Text2 extends StatelessWidget {
  const Text2({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "$text1 ",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: BrandColors.greyColor,
            ),
          ),
          TextSpan(
            text: text2,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: BrandColors.redColor,
            ),
          ),
        ],
      ),
    );
  }
}
