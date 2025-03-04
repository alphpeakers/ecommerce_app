import 'package:ecommerce_app/routes/app_pages.dart';
import 'package:ecommerce_app/utils/Appcolor/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'views/home/home_screen.dart';

//
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.onboardingScreen,
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          title: 'Shop Template by The Flutter Way',
          home: HomeScreen(),
        );
      },
    );
  }
}
