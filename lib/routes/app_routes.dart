import 'package:get/get_navigation/get_navigation.dart';
import 'package:dris_edward/features/splash/screen/splash_screen.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  static String getSplashScreen() => splashScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
  ];
}
