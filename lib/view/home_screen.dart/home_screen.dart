
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:stock_app/controller/search_provider.dart';
import 'package:stock_app/utils/app_colors.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? _debounce;

  void _onSearchChanged(String query, SearchProvider searchProvider) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        searchProvider.search(query);
      }
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        centerTitle: false,
        leading: const SizedBox.shrink(),
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
                offset: const Offset(0, 3), // Shadow position
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
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.foregroundColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextFormField(
                onChanged: (value) => _onSearchChanged(value, searchProvider),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search companies...",
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          if (searchProvider.isLoading)
            const Center(child: CircularProgressIndicator())
          else if (searchProvider.searchResults.isEmpty)
            const Expanded(
              child: Center(
                child: Text(
                  "No results found.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: searchProvider.searchResults.length,
                itemBuilder: (context, index) {
                  final result = searchProvider.searchResults[index];
                  return ListTile(
                    title: Text(
                      result.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.foregroundColor,
                      ),
                    ),
                    subtitle: Text("${result.symbol} (${result.region})"),
                    trailing: Text(
                      result.currency,
                      style: TextStyle(color: AppColors.secondaryColor),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
      bottomNavigationBar: bottomNav(),
    );
  }
}
