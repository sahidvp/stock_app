import 'package:flutter/material.dart';

import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:stock_app/utils/app_colors.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: false,
        leading: SizedBox.shrink(),
        title: Text(
          "HOME",
          style: TextStyle(
              fontWeight: FontWeight.w700, color: AppColors.foregroundColor),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: AppColors.backgroundColor, // AppBar background color
            boxShadow: [
              BoxShadow(
                color:
                    AppColors.secondaryColor.withOpacity(0.5), // Shadow color
                spreadRadius: 1,
                blurRadius: 5, // Adjust for soft or sharp shadow
                offset: Offset(0, 3), // Shadow position
              ),
            ],
            border: Border(
              bottom: BorderSide(
                  color: AppColors.foregroundColor, // Border color
                  width: 0.5 // Border thickness
                  ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
                decoration: BoxDecoration(
                    color: AppColors.foregroundColor,
                    borderRadius: BorderRadius.circular(15)),
                child: TextFormField(
                  decoration: InputDecoration(
                      suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  )),
                )),
          ),
        ],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
