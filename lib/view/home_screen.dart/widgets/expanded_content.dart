import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';
import 'package:stock_app/utils/app_text_styles.dart';

Row expandedContent(String title, String content, IconData icon) {
  return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          title,
          style: AppTextStyles.expandedTitle,
        ),
      ],
    ),
    Text(
      content,
      style: const TextStyle(color: AppColors.backgroundColor),
    )
  ]);
}
