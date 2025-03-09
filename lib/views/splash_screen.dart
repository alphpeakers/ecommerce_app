import 'package:animate_do/animate_do.dart';
import 'package:oxyboots/utils/Appcolor/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes/app_pages.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    Future.delayed(const Duration(seconds: 2), () {
      Get.offNamed(AppRoutes.onboardingScreen);
    });
    return Scaffold(
      backgroundColor: theme.primaryColor,
      extendBodyBehindAppBar: true,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElasticInRight(
              duration: const Duration(milliseconds: 400),
              child: const Text(
                'Oxy Boots',
                style: TextStyle(
                    fontFamily: 'Cinzel', fontSize: 45, color: AppTheme.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
