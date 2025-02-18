import 'package:scaper_mobile/internalization/app_strings.dart';

class EnglishStrings {
  static Map<String, String> getStrings() {
    return {
      // Main screen
      AppStrings.home: 'Home',
      AppStrings.profile: 'Profile',
      AppStrings.support: 'Support',

      // Landing screen
      AppStrings.pibl: 'POWER INSURANCE BROKERS\nLTD.',
      AppStrings.piblSubtitle: 'Insurance at your convenience',
      AppStrings.welcomeText:
          'Welcome to\nPower Insurance Brokerage\nSelf Service',
      AppStrings.explore: 'Explore',
      AppStrings.getQuote: 'Get Quote',

      // Login Screen
      AppStrings.welcomeBack: 'Welcome\nBack!',
      AppStrings.hello: 'Hello!',
      AppStrings.login: 'Login',
      AppStrings.rememberMe: 'Remember Me',
      AppStrings.forgotPassword: 'Forgot Password?',
      AppStrings.otherLoginOptions: 'Other Login Options',
      AppStrings.dontHaveAccount: 'Don\'t have an account?',
      AppStrings.alreadyHaveAccount: 'Already have an account?',
      AppStrings.signUp: 'Sign Up',
      AppStrings.username: 'Username',
      AppStrings.password: 'Password',
      AppStrings.email: 'Email',
      AppStrings.phoneNumber: 'Phone number',
      AppStrings.inputFieldRequired: '@field is required',
      AppStrings.inputFieldInvalid: '@field is invalid',
      AppStrings.inputPasswordInvalid:
          '@field must be between 4 and 20 characters',
      AppStrings.genericErrorMessage:
          'There has been an error. Please retry later.',

      // Home
      AppStrings.homeTitle: 'Scaper Test',
      AppStrings.testInstruction: '''
        In each game you'll be playing a role. The character on the screen will engage you in an informal conversation. Your job is to listen and respond with your preferred choice. It is not a simple choice between right and wrong answers. The choices represent your preference concerning the subject of conversation.

        At every moment you should listen to what the character on the screen says and try to understand the meaning and intent. You will not have the ability to repeat any of the answers or the speech of the character. Even if you are not sure you understand, you must use your judgement to choose one of the proposed answers. You will always have two opportunities to play each game. Your score will be based on your answers in the second round of each game. You can view the first one as essentially as a trial round.
        
        The first dialogue is a demonstration game. It does not produce a score. Here's a tip: don’t try to be perfect. Choose the answers that seem to you the most natural, the most logical in the context and the best formulated
      ''',
    };
  }
}
