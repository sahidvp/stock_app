import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock_app/controller/search_provider.dart';
import 'package:stock_app/utils/app_theme.dart';
import 'package:stock_app/view/home_screen.dart/home_screen.dart';
import 'package:stock_app/view/splash_screen.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SearchProvider()),
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
        "/home": (context) => const HomeScreen()
      },
    );
  }
}
