import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';
import 'package:stock_app/utils/app_text_styles.dart';

AppBar appBar(String title) {
  return AppBar(
    backgroundColor: AppColors.backgroundColor,
    centerTitle: false,
    leading: const SizedBox.shrink(),
    title: Text(
      title,
      style: AppTextStyles.appBarTitle,
    ),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: AppColors.secondaryColor.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        border: const Border(
          bottom: BorderSide(
            color: AppColors.foregroundColor,
            width: 0.5,
          ),
        ),
      ),
    ),
  );
}
