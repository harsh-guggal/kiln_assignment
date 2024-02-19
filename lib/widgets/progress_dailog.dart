import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:guggal_social/utils/brand_colors.dart';

class ProgressDailog extends StatelessWidget {
  final String status;

  const ProgressDailog({super.key, required this.status});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      backgroundColor: Colors.transparent,
      child: Container(
        margin: const EdgeInsets.all(16.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              CircularProgressIndicator(
                color: BrandColors.primaryColor,
              ),
              const SizedBox(width: 16.0),
              Expanded(
                child: Text(
                  status,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontVariations: [FontVariation('wght', 500)],
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
