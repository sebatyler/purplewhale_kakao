import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:purplewhale/enums.dart';
import 'package:purplewhale/services/auth_service.dart';

class SignInController extends GetxController {
  final AuthService _authService = Get.find();
  final lastSignInProvider = Rx<SignInProvider?>(null);
  final isLoading = false.obs;
  final currentProvider = Rx<SignInProvider?>(null);

  @override
  void onInit() {
    super.onInit();
    getLastSignInProvider();
  }

  void getLastSignInProvider() {
    lastSignInProvider.value = _authService.getLastSignInProvider();
  }

  void signIn(SignInProvider provider) async {
    currentProvider.value = provider;
    isLoading.value = true;
    String errorMessage = "사용자 인증에 실패했습니다.";

    try {
      await _authService.signIn(provider);
      _authService.moveAfterSignIn();
    } catch (e) {
      log("signIn failed: $e");

      if (e is KakaoException) {
        errorMessage = e.message ?? errorMessage;
      }

      if (!Get.isSnackbarOpen) {
        Get.snackbar("사용자 인증", errorMessage, backgroundColor: Colors.white);
      }

      // clean up
      await _authService.signOutAll();
    }

    isLoading.value = false;
    currentProvider.value = null;
  }
}
