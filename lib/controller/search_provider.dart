

import 'dart:async';
import 'package:flutter/foundation.dart';

import '../model/search_results.dart';
import '../services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  final SearchService _searchService = SearchService();
  List<SearchResult> _searchResults = [];
  bool _isLoading = false;
  Timer? _debounce; // Timer for debouncing

  List<SearchResult> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

  /// Debounced search handler
  void onSearchChanged(String keywords) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (keywords.isNotEmpty) {
        search(keywords);
      }
    });
  }

  /// Perform the search operation
  Future<void> search(String keywords) async {
    _isLoading = true;
    notifyListeners();

    try {
      
      final results = await _searchService.fetchSearchResults(keywords);
      _searchResults = results.bestMatches;
    } catch (e) {
      _searchResults = [];
      rethrow;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }
}
