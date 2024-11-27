import 'package:hive/hive.dart';
import 'package:stock_app/model/search_results.dart';


class WhishlistDb{
  static const String watchlistBox = 'watchlist';

  Future<void> addStock(SearchResult stock) async{
    var box = await Hive.openBox<SearchResult>(watchlistBox);
    box.put(stock.symbol, stock);
  }

  Future<List<SearchResult>> getWatchlist() async{
    var box = await Hive.openBox<SearchResult>(watchlistBox);
    return box.values.toList();
  }

  Future<void> removeStock(String symbol) async{
    var box = await Hive.openBox<SearchResult>(watchlistBox);
    box.delete(symbol);
  }
  Future<bool> isStockInWatchlist(String symbol) async {
  var box = await Hive.openBox<SearchResult>(watchlistBox);
  return box.containsKey(symbol);
}
  
}