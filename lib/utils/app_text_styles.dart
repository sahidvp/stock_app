import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';

class AppTextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontWeight: FontWeight.w700,
    color: AppColors.foregroundColor,
  );
  static const TextStyle expandedTitle = TextStyle(
      color: AppColors.backgroundColor,
      fontWeight: FontWeight.w700,
      fontSize: 13);
  static const TextStyle companyTitle =
      TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 12);
}
