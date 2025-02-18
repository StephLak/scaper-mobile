import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_styles.dart';
import 'package:scaper_mobile/internalization/app_strings.dart';
import 'package:scaper_mobile/core/login/controller/login_controller.dart';
import 'package:scaper_mobile/navigation/routes.dart';
import 'package:scaper_mobile/shared/auth_bg.dart';
import 'package:scaper_mobile/shared/custom_button.dart';
import 'package:scaper_mobile/shared/custom_input/custom_input.dart';
import 'package:scaper_mobile/utils/validators.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());
    return AuthBg(
      title: AppStrings.welcomeBack.tr,
      child: Expanded(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: queryWidth(context) * 0.05,
              ),
              child: Form(
                key: controller.loginFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 60,
                        bottom: 30,
                      ),
                      child: Text(
                        AppStrings.login.tr,
                        style: Styles.boldTextStyle(size: 20),
                      ),
                    ),
                    CustomInput(
                      hint: AppStrings.email.tr,
                      controller: controller.emailController,
                      validator: (value) => Validators.emailValidator(
                        value,
                        AppStrings.email.tr,
                      ),
                    ),
                    Obx(
                      () => CustomInput(
                        hint: AppStrings.password.tr,
                        controller: controller.passwordController,
                        obscure: controller.obscurePassword.value,
                        validator: (value) => Validators.passwordValidator(
                          value,
                          AppStrings.password.tr,
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: GestureDetector(
                            onTap: controller.updateObscure,
                            child: Icon(
                              controller.obscurePassword.value
                                  ? Icons.remove_red_eye
                                  : CupertinoIcons.eye_slash_fill,
                              size: 30,
                              color: AppColors.tileColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 30),
                      child: Obx(
                        () => CustomButton(
                          text: AppStrings.login.tr,
                          onPressed: controller.login,
                          loading: controller.loading.value,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppStrings.dontHaveAccount.tr,
                            style: Styles.regularTextStyle(),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () => Get.offNamed(AppRoutes.signup),
                            child: Text(
                              AppStrings.signUp.tr,
                              style: Styles.semiBoldTextStyle(size: 14),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
