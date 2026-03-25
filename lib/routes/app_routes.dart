import 'package:dris_edward/features/auth/create_new_password/screen/create_new_password_screen.dart';
import 'package:dris_edward/features/auth/login/screen/login_screen.dart';
import 'package:dris_edward/features/auth/reset_password/screen/reset_password_screen.dart';
import 'package:dris_edward/features/auth/signup/screen/signup_screen.dart';
import 'package:dris_edward/features/auth/verification/screen/verification_screen.dart';
import 'package:dris_edward/features/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:dris_edward/features/onboarding_1/screen/onboarding_1.dart';
import 'package:dris_edward/features/onboarding_2/screen/onboarding_2.dart';
import 'package:dris_edward/features/onboarding_3/screen/onboarding_3.dart';
import 'package:dris_edward/features/onboarding_4/screen/onboarding_4.dart';
import 'package:dris_edward/features/select_resturant/screen/select_resturant_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:dris_edward/features/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  static String onboarding1 = '/onboarding1';
  static String onboarding2 = '/onboarding2';
  static String onboarding3 = '/onboarding3';
  static String onboarding4 = '/onboarding4';
  static String loginScreen = '/loginScreen';
  static String signupScreen = '/signupScreen';
  static String resetPasswordScreen = '/resetPasswordScreen';
  static String verificationScreen = '/verificationScreen';
  static String createNewPasswordScreen = '/createNewPasswordScreen';
  static String bottomNavbarScreen = '/bottomNavbarScreen';
  static String selectResturantScreen = '/selectResturantScreen';

  static String getSplashScreen() => splashScreen;
  static String getOnboarding1() => onboarding1;
  static String getOnboarding2() => onboarding2;
  static String getOnboarding3() => onboarding3;
  static String getOnboarding4() => onboarding4;
  static String getLoginScreen() => loginScreen;
  static String getSignupScreen() => signupScreen;
  static String getResetPasswordScreen() => resetPasswordScreen;
  static String getVerificationScreen() => verificationScreen;
  static String getCreateNewPasswordScreen() => createNewPasswordScreen;
  static String getBottomNavbarScreen() => bottomNavbarScreen;
  static String getSelectResturantScreen() => selectResturantScreen;
  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboarding1, page: () => Onboarding1()),
    GetPage(name: onboarding2, page: () => Onboarding2()),
    GetPage(name: onboarding3, page: () => Onboarding3()),
    GetPage(name: onboarding4, page: () => Onboarding4()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signupScreen, page: () => SignupScreen()),
    GetPage(name: resetPasswordScreen, page: () => ResetPasswordScreen()),
    GetPage(name: verificationScreen, page: () => VerificationScreen()),
    GetPage(
      name: createNewPasswordScreen,
      page: () => CreateNewPasswordScreen(),
    ),
    GetPage(name: bottomNavbarScreen, page: () => NavBarScreen()),
    GetPage(name: selectResturantScreen, page: () => SelectResturantScreen()),
  ];
}
