import 'package:oxyboots/bindings.dart/auth_binding.dart';
import 'package:oxyboots/bindings.dart/favourite_binding.dart';
import 'package:oxyboots/bindings.dart/onboarding_binding.dart';
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
import '../bindings.dart/dashboard_binding.dart';
import '../bindings.dart/product_binding.dart';
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
      bindings: [DashboardBinding(), FavouriteBinding(), ProductBinding()],
    ),
    GetPage(
        name: AppRoutes.phoneAuthScreen,
        page: () => PhoneAuthScreen(),
        binding: AuthBinding()),
    GetPage(
      name: AppRoutes.searchScreen,
      transition: Transition.circularReveal,
      page: () => const SearchScreen(),
    ),
    GetPage(
      name: AppRoutes.home,
      transition: Transition.upToDown,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => HomeScreen(),
    ),
    GetPage(
      name: AppRoutes.phoneAuthScreen,
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => PhoneAuthScreen(),
    ),
    GetPage(
      name: AppRoutes.otpScreen,
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 500),
      page: () => OtpScreen(),
    ),
    GetPage(name: AppRoutes.searchScreen, page: () => const SearchScreen()),
    GetPage(
        name: AppRoutes.onboardingScreen,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        page: () => OnboardingScreen(),
        binding: OnboardingBinding()),
    GetPage(name: AppRoutes.notifcation, page: () => const NotifyScreen()),
    GetPage(
        name: AppRoutes.myCardScreen,
        transition: Transition.zoom,
        transitionDuration: const Duration(milliseconds: 500),
        page: () => MycardScreen(),
        binding: ProductBinding()),
    GetPage(name: AppRoutes.ordersScreen, page: () => const OrdersScreen()),
    GetPage(name: AppRoutes.profileScreen, page: () => const ProfileScreen()),
    GetPage(name: AppRoutes.checkOutScreen, page: () => const CheckoutScreen()),
    GetPage(
        name: AppRoutes.favouriteScreen,
        page: () => FavouriteScreen(),
        bindings: [FavouriteBinding(), ProductBinding()]),
    GetPage(
        name: AppRoutes.detailsScreen,
        transition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 500),
        page: () => DetailsScreen(),
        binding: ProductBinding()),
    GetPage(name: AppRoutes.aboutScreen, page: () => const AboutUsScreen()),
    GetPage(name: AppRoutes.supportScreen, page: () => const SupportScreen()),
  ];
}
