import 'package:flutter/material.dart';
import 'package:stock_app/utils/app_colors.dart';

Padding bottomNav() {
  return Padding(
    padding: const EdgeInsets.all(15),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10), // Apply the border radius
      child: BottomNavigationBar(
        selectedItemColor: AppColors.backgroundColor,
        unselectedItemColor: AppColors.backgroundColor.withOpacity(.5),
        backgroundColor: AppColors.secondaryColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.bookmark), label: "Wishlist"),
        ],
      ),
    ),
  );
}
