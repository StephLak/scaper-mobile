import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_constants.dart';
import 'package:scaper_mobile/core/home/view/home_screen.dart';
import 'package:scaper_mobile/core/login/view/login_screen.dart';
import 'package:scaper_mobile/internalization/app_strings.dart';
import 'package:scaper_mobile/navigation/routes.dart';
import 'package:scaper_mobile/utils/scaper_logger.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

void main() async {
  await dotenv.load(fileName: AppConstants.envPath);
  await GetStorage.init();
  ScaperLogger.init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: AppConstants.appName,
      locale: AppConstants.engLocale,
      getPages: AppRoutes.routes,
      supportedLocales: const <Locale>[AppConstants.engLocale],
      fallbackLocale: AppConstants.engLocale,
      translations: AppStrings(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: AppColors.primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
        useMaterial3: true,
        fontFamily: AppConstants.fontFamily,
      ),
      // To stay logged in
      home: decryptData(AppConstants.accessToken) != null
          ? const HomeScreen()
          : const LoginScreen(),
      // home: LoginScreen(),
    );
  }
}
