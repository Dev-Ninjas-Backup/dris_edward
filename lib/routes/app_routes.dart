import 'package:dris_edward/features/customer_flow/add_to_cart/screen/add_to_cart_screen.dart';
import 'package:dris_edward/features/auth/create_new_password/screen/create_new_password_screen.dart';
import 'package:dris_edward/features/auth/login/screen/login_screen.dart';
import 'package:dris_edward/features/auth/reset_password/screen/reset_password_screen.dart';
import 'package:dris_edward/features/auth/signup/screen/signup_screen.dart';
import 'package:dris_edward/features/auth/verification/screen/verification_screen.dart';
import 'package:dris_edward/features/customer_flow/bottom_navbar/screen/bottom_navbar_screen.dart';
import 'package:dris_edward/features/customer_flow/checkout/screen/checkout_screen.dart';
import 'package:dris_edward/features/customer_flow/explore_menu/screen/explore_menu_screen.dart';
import 'package:dris_edward/features/customer_flow/favorite/screen/favorite_screen.dart';
import 'package:dris_edward/features/onboarding_1/screen/onboarding_screen.dart';
import 'package:dris_edward/features/onboarding_4/screen/onboarding_4.dart';
import 'package:dris_edward/features/customer_flow/order_details/screen/order_details_screen.dart';
import 'package:dris_edward/features/customer_flow/order_history/screen/order_history_screen.dart';
import 'package:dris_edward/features/customer_flow/product_details/screen/product_details_screen.dart';
import 'package:dris_edward/features/customer_flow/profile_info/screen/profile_info_screen.dart';
import 'package:dris_edward/features/customer_flow/revirew/screen/review_screen.dart';
import 'package:dris_edward/features/customer_flow/select_resturant/screen/select_resturant_screen.dart';
import 'package:dris_edward/home/screen/home_screen.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:dris_edward/features/splash/screen/splash_screen.dart';
import 'package:get/route_manager.dart';
import 'package:get/get.dart';

class AppRoute {
  //splash
  static String splashScreen = '/splashScreen';
  static String onboarding = '/onboarding';
  static String onboarding4 = '/onboarding4';
  static String loginScreen = '/loginScreen';
  static String signupScreen = '/signupScreen';
  static String resetPasswordScreen = '/resetPasswordScreen';
  static String verificationScreen = '/verificationScreen';
  static String createNewPasswordScreen = '/createNewPasswordScreen';
  static String bottomNavbarScreen = '/bottomNavbarScreen';
  static String selectResturantScreen = '/selectResturantScreen';
  static String productDetailsScreen = '/productDetailsScreen';
  static String homeScreen = '/homeScreen';
  static String checkoutScreen = '/checkoutScreen';
  static String addToCartScreen = '/addToCartScreen';
  static String profileInfoScreen = '/profileInfoScreen';
  static String orderHistoryScreen = '/orderHistoryScreen';
  static String orderDetailsScreen = '/orderDetailsScreen';
  static String favoriteScreen = '/favoriteScreen';
  static String exploreMenuScreen = '/exploreMenuScreen';
  static String reviewScreen = '/reviewScreen';

  static String getSplashScreen() => splashScreen;
  static String getOnboarding() => onboarding;
  static String getOnboarding4() => onboarding4;
  static String getLoginScreen() => loginScreen;
  static String getSignupScreen() => signupScreen;
  static String getResetPasswordScreen() => resetPasswordScreen;
  static String getVerificationScreen() => verificationScreen;
  static String getCreateNewPasswordScreen() => createNewPasswordScreen;
  static String getBottomNavbarScreen() => bottomNavbarScreen;
  static String getSelectResturantScreen() => selectResturantScreen;
  static String getProductDetailsScreen() => productDetailsScreen;
  static String getHomeScreen() => homeScreen;
  static String getCheckoutScreen() => checkoutScreen;
  static String getAddToCartScreen() => addToCartScreen;
  static String getProfileInfoScreen() => profileInfoScreen;
  static String getOrderHistoryScreen() => orderHistoryScreen;
  static String getOrderDetailsScreen() => orderDetailsScreen;
  static String getFavoriteScreen() => favoriteScreen;
  static String getExploreMenuScreen() => exploreMenuScreen;
  static String getReviewScreen() => reviewScreen;

  static List<GetPage> routes = [
    GetPage(name: splashScreen, page: () => SplashScreen()),
    GetPage(name: onboarding, page: () => OnboardingScreen()),
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
    GetPage(name: productDetailsScreen, page: () => ProductDetailsScreen()),
    GetPage(name: homeScreen, page: () => HomeScreen()),
    GetPage(name: checkoutScreen, page: () => CheckoutScreen()),
    GetPage(name: addToCartScreen, page: () => AddToCartScreen()),
    GetPage(name: profileInfoScreen, page: () => ProfileInfoScreen()),
    GetPage(name: orderHistoryScreen, page: () => OrderHistoryScreen()),
    GetPage(name: orderDetailsScreen, page: () => OrderDetailsScreen()),
    GetPage(name: favoriteScreen, page: () => FavoriteScreen()),
    GetPage(name: exploreMenuScreen, page: () => ExploreMenuScreen()),
    GetPage(name: reviewScreen, page: () => ReviewScreen()),
  ];
}
