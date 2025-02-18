import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scaper_mobile/internalization/app_strings.dart';
import 'package:scaper_mobile/navigation/routes.dart';
import 'package:scaper_mobile/network/api/api_provider.dart';
import 'package:scaper_mobile/network/models/request/auth_request.dart';
import 'package:scaper_mobile/network/repository/scaper_repository.dart';
import 'package:scaper_mobile/utils/view_utils.dart';

class SignupController extends GetxController {
  ScaperRepository scaperRepository =
      ScaperRepository(appApiProvider: ApiProvider());
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RxBool obscurePassword = true.obs;
  RxBool loading = false.obs;

  updateObscure() {
    obscurePassword.value = !obscurePassword.value;
  }

  Future<void> register() async {
    if (registerFormKey.currentState!.validate()) {
      loading.value = true;
      try {
        final response = await scaperRepository.register(
          AuthRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        if (response.data.response!.statusCode == 400) {
          showSnackbarMessage(message: response.message, isSuccess: false);
        } else {
          if (response.data.response!.statusCode == 201) {
            Get.offNamed(AppRoutes.login);
          }
        }
        loading.value = false;
      } catch (e) {
        loading.value = false;
        showSnackbarMessage(
            message: AppStrings.genericErrorMessage.tr, isSuccess: false);
      }
    }
  }

  @override
  void onInit() {
    emailController.text = 'abcd@gmail.com';
    passwordController.text = 'abcd';
    super.onInit();
  }
}
