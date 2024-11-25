import 'package:flutter/foundation.dart';

import '../model/search_results.dart';
import '../services/search_service.dart';

class SearchProvider extends ChangeNotifier {
  final SearchService _searchService = SearchService();
  List<SearchResult> _searchResults = [];
  bool _isLoading = false;

  List<SearchResult> get searchResults => _searchResults;
  bool get isLoading => _isLoading;

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
}
