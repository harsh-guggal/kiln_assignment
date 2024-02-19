import 'package:flutter/material.dart';

class BrandColors {
  // static Color primaryColor = const Color.fromRGBO(140, 88, 255, 1);
  static Color primaryColor = const Color.fromRGBO(53, 73, 255, 1);

  static Color primaryColor1 = const Color.fromRGBO(167, 178, 255, 1);
  static Color secondaryColor = const Color.fromRGBO(249, 249, 249, 1);
  static Color appBackgroundColor = const Color.fromRGBO(255, 255, 255, 1);
  static Color primaryTextColor = const Color.fromRGBO(21, 25, 36, 1);
  static Color secondaryTextColor = const Color.fromRGBO(97, 97, 97, 1);
  static Color greyColor = const Color.fromRGBO(141, 141, 141, 1);
  static Color redColor = const Color.fromRGBO(171, 55, 58, 1);

  static Color greyColor1 = const Color.fromRGBO(249, 249, 249, 1);

  static Color greyColor2 = const Color.fromRGBO(239, 239, 239, 1);

  static Color greyColor3 = const Color.fromRGBO(130, 130, 130, 1);

  static Color greyColor4 = const Color.fromRGBO(93, 92, 90, 1);

  static Color blackColor1 = const Color.fromRGBO(46, 46, 46, 1);

  static Color progressOpenColor = Colors.green;
  static Color progressProgressColor = Colors.orange;
  static Color progressCompletedColor = Colors.blue;
  static Color progressCancelledColor = Colors.red;

  static Color priorityLowColor = Colors.orange;
  static Color priorityMediumColor = Colors.green;
  static Color priorityHighColor = Colors.blue;
  static Color priorityUrgentColor = Colors.red;
}

Color getPriorityColor(String value) {
  switch (value) {
    case 'low':
      return BrandColors.priorityLowColor;
    case 'medium':
      return BrandColors.priorityMediumColor;
    case 'high':
      return BrandColors.priorityHighColor;
    case 'urgent':
      return BrandColors.priorityUrgentColor;
    default:
      return BrandColors.priorityLowColor;
  }
}

Color getProgressColor(String value) {
  switch (value) {
    case 'open':
      return BrandColors.progressOpenColor;
    case 'in_progress':
      return BrandColors.progressProgressColor;
    case 'completed':
      return BrandColors.progressCompletedColor;
    case 'cancelled':
      return BrandColors.progressCancelledColor;
    default:
      return BrandColors.progressOpenColor;
  }
}
