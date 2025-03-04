import 'package:ecommerce_app/views/auth/signin_screen.dart';
import 'package:ecommerce_app/views/home/home_screen.dart';
import 'package:ecommerce_app/views/mycard/mycard_screen.dart';
import 'package:ecommerce_app/views/notfication/notify_screen.dart';
import 'package:ecommerce_app/views/onboarding/onboarding_screen.dart';
import 'package:ecommerce_app/views/orders/orders_screen.dart';
import 'package:ecommerce_app/views/profile/profile_screen.dart';
import 'package:ecommerce_app/views/search/search_screen.dart';
import 'package:get/get.dart';

import '../views/auth/otp_screen.dart';
import '../views/detail/details_screen.dart';
import '../views/favourite/favourite_screen.dart';
import '../views/mycard/checkout_screen.dart';

class AppRoutes {
  static const phoneAuthScreen = '/phoneAuthScreen';
  static const signup = '/signup';
  static const otpScreen = '/otpScreen';
  static const onboardingScreen = '/onboardingScreen';
  static const home = '/home';
  static const notifcation = '/notification';
  static const searchScreen = '/searchScreen';
  static const myCardScreen = '/myCardScreen';
  static const ordersScreen = '/ordersScreen';
  static const profileScreen = '/profileScreen';
  static const checkOutScreen = '/checkOutScreen';
  static const favouriteScreen = '/favouriteScreen';
  static const detailsScreen = '/detailsScreen';
  static final routes = [
    GetPage(
      name: AppRoutes.searchScreen,
      transition: Transition.circularReveal,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.phoneAuthScreen,
      page: () => PhoneAuthScreen(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      page: () => OtpScreen(),
    ),
    GetPage(name: AppRoutes.searchScreen, page: () => SearchScreen()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.notifcation, page: () => NotifyScreen()),
    GetPage(name: AppRoutes.myCardScreen, page: () => MycardScreen()),
    GetPage(name: AppRoutes.ordersScreen, page: () => OrdersScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.checkOutScreen, page: () => CheckoutScreen()),
    GetPage(name: AppRoutes.favouriteScreen, page: () => FavouriteScreen()),
    GetPage(name: AppRoutes.detailsScreen, page: () => DetailsScreen()),
  ];
}
