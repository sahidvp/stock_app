import 'package:flutter/material.dart';
import 'package:stock_app/controller/search_provider.dart';
import 'package:stock_app/utils/app_colors.dart';

Padding searchBar(SearchProvider searchProvider) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.secondaryColor, width: 3),
        color: AppColors.foregroundColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextFormField(
        onChanged: (value) => searchProvider.onSearchChanged(value),
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          border: InputBorder.none,
          hintText: "Search companies...",
          suffixIcon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
      ),
    ),
  );
}
