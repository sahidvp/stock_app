import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Start the timer and navigate after 3 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, "/home");
    });

    return Scaffold(
        body: Center(
            child: Lottie.asset(
                "assets/animations/Animation - 1732342554836.json")));
  }
}
