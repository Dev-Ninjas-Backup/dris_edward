import 'package:dris_edward/features/onboarding_1/screen/onboarding_1.dart';
import 'package:dris_edward/features/onboarding_2/screen/onboarding_2.dart';
import 'package:dris_edward/features/onboarding_3/screen/onboarding_3.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:dris_edward/features/splash/screen/splash_screen.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  static String onboarding1 = '/onboarding1';
  static String onboarding2 = '/onboarding2';
  static String onboarding3 = '/onboarding3';
  static String getSplashScreen() => splashScreen;
  static String getOnboarding1() => onboarding1;
  static String getOnboarding2() => onboarding2;
  static String getOnboarding3() => onboarding3;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboarding1, page: () => Onboarding1()),
    GetPage(name: onboarding2, page: () => Onboarding2()),
    GetPage(name: onboarding3, page: () => Onboarding3()),
  ];
}
