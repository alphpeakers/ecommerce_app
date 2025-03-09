import 'package:oxyboots/binding.dart';
import 'package:oxyboots/views/auth/signin_screen.dart';
import 'package:oxyboots/views/dashboard.dart';
import 'package:oxyboots/views/home/home_screen.dart';
import 'package:oxyboots/views/mycard/mycard_screen.dart';
import 'package:oxyboots/views/notfication/notify_screen.dart';
import 'package:oxyboots/views/onboarding/onboarding_screen.dart';
import 'package:oxyboots/views/orders/orders_screen.dart';
import 'package:oxyboots/views/profile/profile_screen.dart';
import 'package:oxyboots/views/search/search_screen.dart';
import 'package:oxyboots/views/splash_screen.dart';
import 'package:get/get.dart';

import '../views/about_us.dart';
import '../views/auth/otp_screen.dart';
import '../views/detail/details_screen.dart';
import '../views/favourite/favourite_screen.dart';
import '../views/mycard/checkout_screen.dart';
import '../views/support_screen.dart';

class AppRoutes {
  static const splashScreen = '/splashScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const phoneAuthScreen = '/phoneAuthScreen';
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
  static const aboutScreen = '/aboutScreen';
  static const supportScreen = '/supportScreen';
  static final routes = [
    GetPage(
      transition: Transition.circularReveal,
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
     
    ),
    GetPage(
      name: AppRoutes.dashboardScreen,
      page: () => Dashboard(),
    ),
    GetPage(
      name: AppRoutes.phoneAuthScreen,
      page: () => PhoneAuthScreen(),
    ),
    GetPage(
      name: AppRoutes.searchScreen,
      transition: Transition.circularReveal,
      page: () => const SearchScreen(),
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
    GetPage(name: AppRoutes.searchScreen, page: () => const SearchScreen()),
    GetPage(name: AppRoutes.onboardingScreen, page: () => OnboardingScreen()),
    GetPage(name: AppRoutes.notifcation, page: () => const NotifyScreen()),
    GetPage(name: AppRoutes.myCardScreen, page: () => MycardScreen(),binding: SampleBinding()),
    GetPage(name: AppRoutes.ordersScreen, page: () => const OrdersScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
    GetPage(name: AppRoutes.checkOutScreen, page: () => const CheckoutScreen()),
    GetPage(name: AppRoutes.favouriteScreen, page: () => FavouriteScreen()),
    GetPage(name: AppRoutes.detailsScreen, page: () => DetailsScreen()),
    GetPage(name: AppRoutes.aboutScreen, page: () => const AboutUsScreen()),
    GetPage(name: AppRoutes.supportScreen, page: () => const SupportScreen()),
  ];
}
