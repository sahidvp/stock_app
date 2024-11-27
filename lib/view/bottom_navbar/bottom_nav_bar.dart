import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/bottomNav_provider.dart';
import 'package:stock_app/utils/app_colors.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    final tabIndexProvider = context.read<BottomnavProvider>();
    final currentIndex = context.watch<BottomnavProvider>().currentIndex;

    return Padding(
      padding: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => tabIndexProvider.updateIndex(index),
          selectedItemColor: AppColors.backgroundColor,
          unselectedItemColor: AppColors.backgroundColor.withOpacity(.5),
          backgroundColor: AppColors.secondaryColor,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.bookmark), label: "Watchlist"),
          ],
        ),
      ),
    );
  }
}
