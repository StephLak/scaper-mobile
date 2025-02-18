import 'package:get/get.dart';
import 'package:scaper_mobile/internalization/english_strings.dart';

class AppStrings extends Translations {
  // Main Screen
  static const String home = 'home';
  static const String support = 'support';
  static const String profile = 'profile';
  static const String pibl = 'pibl';
  static const String piblSubtitle = 'piblSubtitle';
  static const String welcomeText = 'welcomeText';
  static const String explore = 'explore';
  static const String getQuote = 'getQuote';

  // Login
  static const String welcomeBack = 'welcomeBack';
  static const String hello = 'hello';
  static const String login = 'login';
  static const String rememberMe = 'rememberMe';
  static const String forgotPassword = 'forgotPassword';
  static const String otherLoginOptions = 'otherLoginOptions';
  static const String dontHaveAccount = 'dontHaveAccount';
  static const String alreadyHaveAccount = 'alreadyHaveAccount';
  static const String signUp = 'signUp';
  static const String username = 'username';
  static const String password = 'password';
  static const String email = 'email';
  static const String phoneNumber = 'phoneNumber';
  static const String inputFieldRequired = 'inputFieldRequired';
  static const String inputFieldInvalid = 'inputFieldInvalid';
  static const String inputPasswordInvalid = 'inputPasswordInvalid';
  static const String genericErrorMessage = 'genericErrorMessage';

  // Home
  static const String homeTitle = 'homeTitle';
  static const String testInstruction = 'testInstruction';

  @override
  Map<String, Map<String, String>> get keys => {
        // Italian
        'en': EnglishStrings.getStrings(),
      };
}
