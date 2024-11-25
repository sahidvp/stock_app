import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stock_app/config/api_key.dart';
import 'package:stock_app/model/search_results.dart';

class SearchService {
  static const String _baseUrl = 'https://www.alphavantage.co/query';
  static const String _apiKey = ApiKeys.apiKey;

  Future<SearchResultsResponse> fetchSearchResults(String keywords) async {
    final url = Uri.parse(
        '$_baseUrl?function=SYMBOL_SEARCH&keywords=$keywords&apikey=$_apiKey');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
      final data = json.decode(response.body);
      return SearchResultsResponse.fromJson(data);
    } else {
      throw Exception('Failed to fetch search results');
    }
  }
}
