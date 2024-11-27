import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/watchlist_provider.dart';
import 'package:stock_app/utils/app_text_styles.dart';
import 'package:stock_app/view/home_screen.dart/widgets/expanded_list.dart';

import '../home_screen.dart/widgets/app_bar.dart';

class WatchlistScreen extends StatelessWidget {
  const WatchlistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Watchlist"),
      body: Consumer<WatchlistProvider>(
        builder: (context, provider, _) {
          final watchlist = provider.watchlist;

          if (watchlist.isEmpty) {
            return Center(
                child: SizedBox(
                    width: 150,
                    child: Lottie.asset("assets/animations/emptywatchlist.json",
                        repeat: false)));
          }

          return ListView.builder(
            itemCount: watchlist.length,
            itemBuilder: (context, index) {
              final stock = watchlist[index];
              return ExpandableListItem(result: stock, isHomeScreen: false);
            },
          );
        },
      ),
    );
  }
}
