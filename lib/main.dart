import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/bottomNav_provider.dart';
import 'package:stock_app/controller/expanded_items_provider.dart';
import 'package:stock_app/controller/search_provider.dart';
import 'package:stock_app/controller/watchlist_provider.dart';
import 'package:stock_app/model/search_results.dart';
import 'package:stock_app/utils/app_theme.dart';
import 'package:stock_app/view/bottom_navbar/bottom_navbar.dart';
import 'package:stock_app/view/home_screen.dart/home_screen.dart';
import 'package:stock_app/view/splash_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(SearchResultAdapter());
  await Hive.openBox<SearchResult>('watchlist');
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => BottomnavProvider()),
      ChangeNotifierProvider(create: (_) => ExpandableItemProvider()),
       ChangeNotifierProvider(create: (_) => WatchlistProvider()..fetchWatchlist()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.themeData,
      darkTheme: AppTheme.darkTheme,
      initialRoute: "/splash",
      routes: {
        "/splash": (context) => const SplashScreen(),
        "/home": (context) => const HomeScreen(),
        "/bottomnav": (context) => const BottomNavbar(),
      },
    );
  }
}
