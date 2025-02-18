import 'package:get/get.dart';
import 'package:scaper_mobile/internalization/app_strings.dart';
import 'package:scaper_mobile/utils/extensions.dart';

class Validators {
  static const String passwordRegex = r"^.{4,20}$";
  static const String emailRegex =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9-]+\.[a-zA-Z]+";

  static String? passwordValidator(String? value, String field) {
    if (value!.isEmpty) {
      return AppStrings.inputFieldRequired.trParams({'field': field});
    }
    if (!value.isValidPassword()) {
      return AppStrings.inputFieldInvalid.trParams({'field': field});
    }
    return null;
  }

  static String? emailValidator(String? value, String field) {
    // if (value!.isEmpty) {
    //   return AppStrings.inputFieldRequired.trParams({'field': field});
    // }
    if (value!.isNotEmpty && !value.isValidEmail()) {
      return AppStrings.inputFieldInvalid.trParams({'field': field});
    }
    return null;
  }
}
