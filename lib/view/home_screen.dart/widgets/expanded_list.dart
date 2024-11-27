// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:stock_app/controller/expanded_items_provider.dart';
// import 'package:stock_app/utils/app_colors.dart';
// import 'package:stock_app/utils/app_text_styles.dart';
// import '../../../model/search_results.dart';
// import 'expanded_content.dart';

// class ExpandableListItem extends StatelessWidget {
//   final SearchResult result;

//   const ExpandableListItem({
//     super.key,
//     required this.result,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final sw = MediaQuery.of(context).size.width;
//     return ChangeNotifierProvider(
//       create: (_) => ExpandableItemProvider(),
//       child: Consumer<ExpandableItemProvider>(
//         builder: (context, provider, _) {
//           return Padding(
//             padding: const EdgeInsets.all(5),
//             child: Row(children: [
//               Expanded(
//                 flex: 5,
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: AppColors.secondaryColor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     children: [
//                       ListTile(
//                         title: Text(
//                           result.name,
//                           style: AppTextStyles.companyTitle,
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(
//                             provider.isExpanded
//                                 ? Icons.arrow_drop_up
//                                 : Icons.arrow_drop_down,
//                           ),
//                           onPressed: provider.toggleExpansion,
//                         ),
//                       ),
//                       if (provider.isExpanded)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               horizontal: 16, vertical: 8),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               expandedContent(
//                                   "Region", result.symbol, Icons.public),
//                               expandedContent("Market open", result.marketOpen,
//                                   Icons.access_time),
//                               expandedContent("Market close",
//                                   result.marketClose, Icons.access_time),
//                               expandedContent(
//                                   "Time Zone", result.timezone, Icons.timer),
//                               expandedContent("Currency", result.currency,
//                                   Icons.monetization_on),
//                               expandedContent("Match score",
//                                   result.matchScore.toString(), Icons.star),
//                             ],
//                           ),
//                         ),
//                     ],
//                   ),
//                 ),
//               ),
//               if (!provider.isExpanded) ...[
//                 SizedBox(
//                   width: 5,
//                 ),
//                 Expanded(
//                   flex: 1,
//                   child: Container(
//                       height: sw * .15,
//                       decoration: BoxDecoration(
//                           color: AppColors.secondaryColor,
//                           borderRadius: BorderRadius.circular(10)),
//                       child: Center(
//                           child: Icon(
//                         Icons.add,
//                         color: AppColors.backgroundColor,
//                       ))),
//                 )
//               ]
//             ]),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/expanded_items_provider.dart';
import 'package:stock_app/controller/watchlist_provider.dart';
import 'package:stock_app/model/search_results.dart';

import 'package:stock_app/utils/app_colors.dart';
import 'package:stock_app/utils/app_text_styles.dart';
import 'expanded_content.dart';

class ExpandableListItem extends StatelessWidget {
  final SearchResult result;
  final bool isHomeScreen;

  const ExpandableListItem(
      {super.key, required this.result, required this.isHomeScreen});

  @override
  Widget build(BuildContext context) {
    final sw = MediaQuery.of(context).size.width;
    return ChangeNotifierProvider(
      create: (_) => ExpandableItemProvider(),
      child: Consumer2<ExpandableItemProvider, WatchlistProvider>(
        builder: (context, provider, watchlistProvider, _) {
          final isInWatchlist = watchlistProvider.watchlist
              .any((stock) => stock.symbol == result.symbol);

          return Padding(
            padding: const EdgeInsets.all(5),
            child: Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            result.name,
                            style: AppTextStyles.companyTitle,
                          ),
                          trailing: IconButton(
                            icon: Icon(provider.isExpanded
                                ? Icons.arrow_drop_up
                                : Icons.arrow_drop_down),
                            onPressed: provider.toggleExpansion,
                          ),
                        ),
                        if (provider.isExpanded)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                expandedContent(
                                    "Region", result.symbol, Icons.public),
                                expandedContent("Market open",
                                    result.marketOpen, Icons.access_time),
                                expandedContent("Market close",
                                    result.marketClose, Icons.access_time),
                                expandedContent(
                                    "Time Zone", result.timezone, Icons.timer),
                                expandedContent("Currency", result.currency,
                                    Icons.monetization_on),
                                expandedContent("Match score",
                                    result.matchScore.toString(), Icons.star),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                if (!provider.isExpanded) ...[
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        if (isInWatchlist) {
                          watchlistProvider.removeStock(result.symbol);
                        } else {
                          watchlistProvider.addStock(result);
                        }
                      },
                      child: Container(
                          height: sw * .15,
                          decoration: BoxDecoration(
                              color: AppColors.secondaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: isHomeScreen
                                ? Icon(
                                    isInWatchlist ? Icons.remove : Icons.add,
                                    color: AppColors.backgroundColor,
                                  )
                                : IconButton(
                                    icon: const Icon(Icons.delete,
                                        color: AppColors.backgroundColor),
                                    onPressed: () => watchlistProvider
                                        .removeStock(result.symbol),
                                  ),
                          )),
                    ),
                  )
                ],
              ],
            ),
          );
        },
      ),
    );
  }
}
