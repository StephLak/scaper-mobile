import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:get_storage/get_storage.dart';
import 'package:scaper_mobile/constants/app_colors.dart';
import 'package:scaper_mobile/constants/app_constants.dart';
import 'package:scaper_mobile/constants/app_styles.dart';

double queryHeight(BuildContext? context) {
  return context != null ? MediaQuery.of(context).size.height : Get.size.height;
}

double queryWidth(BuildContext? context) {
  return context != null ? MediaQuery.of(context).size.width : Get.size.width;
}

void encryptData({required String key, String value = ''}) {
  final encryptKey = encrypt.Key.fromUtf8(key);
  final iv = encrypt.IV.fromUtf8('HgNRbGHbDS3Bihar');

  final encrypter = encrypt.Encrypter(encrypt.AES(encryptKey));
  final encrypted = encrypter.encrypt(value, iv: iv);
  GetStorage().write(key, encrypted.base64);
}

dynamic decryptData(String key) {
  final encryptKey = encrypt.Key.fromUtf8(key);
  final iv = encrypt.IV.fromUtf8('HgNRbGHbDS3Bihar');

  final decrypter = encrypt.Encrypter(encrypt.AES(encryptKey));
  final encrypted = GetStorage().read(key);
  if (encrypted != null) {
    final decrypted =
        decrypter.decryptBytes(encrypt.Encrypted.fromBase64(encrypted), iv: iv);
    final decryptedData = utf8.decode(decrypted);
    return decryptedData;
  }
  return null;
}

void showSnackbarMessage(
    {required String message, bool isSuccess = true, bool isWarning = false}) {
  final snackbar = GetSnackBar(
    titleText: Text(
      isWarning
          ? 'Info'
          : isSuccess
              ? 'Success'
              : 'Error',
      style: Styles.mediumTextStyle(color: AppColors.white, size: 18),
    ),
    messageText: Text(
      message.capitalizeFirst!,
      style: Styles.regularTextStyle(color: AppColors.white, size: 14),
    ),
    backgroundColor: isWarning
        ? Colors.orangeAccent
        : isSuccess
            ? Colors.green.shade900
            : Colors.red.shade900,
    duration: const Duration(seconds: 3),
    margin: const EdgeInsets.fromLTRB(10, 0, 10, 5),
    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
    borderRadius: AppConstants.snackBarRadius,
  );

  Get.showSnackbar(snackbar);
}
