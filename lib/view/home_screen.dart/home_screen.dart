import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/bottomNav_provider.dart';

import 'package:stock_app/controller/search_provider.dart';

import 'package:stock_app/view/home_screen.dart/widgets/expanded_list.dart';
import 'package:stock_app/view/watchlist_screen.dart/watchlist_screen.dart';

import 'widgets/app_bar.dart';
import '../bottom_navbar/bottom_nav_bar.dart';
import 'widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: appBar("Home"),
      body: Column(
        children: [
          searchBar(searchProvider),
          if (searchProvider.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (searchProvider.searchResults.isEmpty)
            Expanded(
              child: Center(
                  child: Lottie.asset("assets/animations/Animation 2.json")),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: searchProvider.searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchProvider.searchResults[index];
                  return ExpandableListItem(result: result,isWatchList: false,);
                },
              ),
            ),
        ],
      ),
    );
  }
}
