import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';

Row expandedContent(String title, String content, IconData icon) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          Icon(
            icon,
            size: 15,
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: TextStyle(
                color: AppColors.backgroundColor,
                fontWeight: FontWeight.w700,
                fontSize: 15),
          ),
        ],
      ),
      Text(
        content,
        style: TextStyle(color: AppColors.backgroundColor),
      )
    ]);
  }