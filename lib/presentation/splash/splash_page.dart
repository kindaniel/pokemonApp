import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacementNamed(context, '/pokemon-list'),
    );
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/images/splash_bg.png",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                "assets/images/pokemon_logo.png",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Lottie.asset(
              'assets/lottie/pokeball-loading-animation.json',
              width: 45.r,
              height: 45.r,
            ),
          ],
        ),
      ),
    );
  }
}
