import 'package:get/get.dart';
import 'package:purplewhale/enums.dart';
import 'package:purplewhale/services/auth_service.dart';

abstract class UserHandler extends GetxController {
  final AuthService authService = Get.find();
  String? get authToken => authService.authToken.value;
  SignInProvider? get authProvider => authService.getLastSignInProvider();
}
