import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/bottomNav_provider.dart';
import 'package:stock_app/view/bottom_navbar/bottom_nav_bar.dart';

import '../home_screen.dart/home_screen.dart';
import '../watchlist_screen.dart/watchlist_screen.dart';

class BottomNavbar extends StatelessWidget {
  const BottomNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentIndex = context.watch<BottomnavProvider>().currentIndex;
      final screens = [
      const HomeScreen(), 
      const WatchlistScreen()
    ];
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: const BottomNav(),
    );
  }
}