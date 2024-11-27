// class SearchResult {
//   final String symbol;
//   final String name;
//   final String type;
//   final String region;
//   final String marketOpen;
//   final String marketClose;
//   final String timezone;
//   final String currency;
//   final String matchScore;

//   SearchResult({
//     required this.symbol,
//     required this.name,
//     required this.type,
//     required this.region,
//     required this.marketOpen,
//     required this.marketClose,
//     required this.timezone,
//     required this.currency,
//     required this.matchScore,
//   });

//   factory SearchResult.fromJson(Map<String, dynamic> json) {
//     return SearchResult(
//       symbol: json["1. symbol"],
//       name: json["2. name"],
//       type: json["3. type"],
//       region: json["4. region"],
//       marketOpen: json["5. marketOpen"],
//       marketClose: json["6. marketClose"],
//       timezone: json["7. timezone"],
//       currency: json["8. currency"],
//       matchScore: json["9. matchScore"],
//     );
//   }
// }

// class SearchResultsResponse {
//   final List<SearchResult> bestMatches;

//   SearchResultsResponse({required this.bestMatches});

//   factory SearchResultsResponse.fromJson(Map<String, dynamic> json) {
//     return SearchResultsResponse(
//       bestMatches: (json['bestMatches'] as List)
//           .map((item) => SearchResult.fromJson(item))
//           .toList(),
//     );
//   }
// }


import 'package:hive/hive.dart';

part 'search_results.g.dart'; // For the generated adapter

@HiveType(typeId: 0)
class SearchResult extends HiveObject {
  @HiveField(0)
  final String symbol;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String type;

  @HiveField(3)
  final String region;

  @HiveField(4)
  final String marketOpen;

  @HiveField(5)
  final String marketClose;

  @HiveField(6)
  final String timezone;

  @HiveField(7)
  final String currency;

  @HiveField(8)
  final String matchScore;

  SearchResult({
    required this.symbol,
    required this.name,
    required this.type,
    required this.region,
    required this.marketOpen,
    required this.marketClose,
    required this.timezone,
    required this.currency,
    required this.matchScore,
  });

  factory SearchResult.fromJson(Map<String, dynamic> json) {
    return SearchResult(
      symbol: json["1. symbol"],
      name: json["2. name"],
      type: json["3. type"],
      region: json["4. region"],
      marketOpen: json["5. marketOpen"],
      marketClose: json["6. marketClose"],
      timezone: json["7. timezone"],
      currency: json["8. currency"],
      matchScore: json["9. matchScore"],
    );
  }
}

class SearchResultsResponse {
  final List<SearchResult> bestMatches;

  SearchResultsResponse({required this.bestMatches});

  factory SearchResultsResponse.fromJson(Map<String, dynamic> json) {
    return SearchResultsResponse(
      bestMatches: (json['bestMatches'] as List)
          .map((item) => SearchResult.fromJson(item))
          .toList(),
    );
  }
}