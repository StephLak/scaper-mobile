import 'package:get/get.dart';
import 'package:scaper_mobile/core/home/view/home_screen.dart';
import 'package:scaper_mobile/core/login/view/login_screen.dart';
import 'package:scaper_mobile/core/signup/view/signup_screen.dart';
import 'package:scaper_mobile/core/test/views/test_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String login = '/login';
  static const String signup = '/signup';
  static const String quiz = '/quiz';
  static const String home = '/';

  static final routes = [
    GetPage(
      name: login,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: signup,
      page: () => const SignupScreen(),
    ),
    GetPage(
      name: home,
      page: () => const HomeScreen(),
    ),
    GetPage(
      name: quiz,
      page: () => const TestScreen(),
    ),
  ];
}
