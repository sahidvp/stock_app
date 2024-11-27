import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:stock_app/db/watchlist_db.dart';
import 'package:stock_app/model/search_results.dart';


class WatchlistProvider with ChangeNotifier {
  final WhishlistDb _db = WhishlistDb();
  List<SearchResult> _watchlist = [];

  List<SearchResult> get watchlist => _watchlist;

  Future<void> fetchWatchlist() async {
    _watchlist = await _db.getWatchlist();
    notifyListeners();
  }

  Future<void> addStock(SearchResult stock) async {
    await _db.addStock(stock);
    await fetchWatchlist(); // Refresh after adding
  }

  Future<void> removeStock(String symbol) async {
    await _db.removeStock(symbol);
    await fetchWatchlist(); // Refresh after removing
  }
}
