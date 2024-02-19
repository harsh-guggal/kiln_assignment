import 'package:flutter/material.dart';

class BrandContainer extends StatelessWidget {
  const BrandContainer(
      {super.key, required this.brandImage, required this.brandName});
  final String brandImage;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$brandImage.png'),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          brandName,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color.fromRGBO(23, 11, 14, 1),
          ),
        )
      ],
    );
  }
}
