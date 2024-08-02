import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;
import 'package:purplewhale/enums.dart';
import 'env_config.dart';

class AuthService extends GetxService {
  late kakao.UserApi _kakaoApi;
  final _storage = const FlutterSecureStorage();
  final _box = GetStorage();

  final authToken = RxnString();

  static AuthService get to => Get.find();

  AuthService init() {
    KakaoSdk.init(
      nativeAppKey: EnvConfig.get('KAKAO_NATIVE_APP_KEY'),
      javaScriptAppKey: EnvConfig.get('KAKAO_JAVASCRIPT_APP_KEY'),
    );
    _kakaoApi = kakao.UserApi.instance;
    return this;
  }

  SignInProvider? getLastSignInProvider() {
    SignInProvider? provider = _box.read('provider');
    return provider;
  }

  Future<void> signOutAll() async {
    try {
      await _storage.delete(key: 'apiToken');
      await Future.wait([_kakaoApi.logout(), FlutterNaverLogin.logOut()]);
    } catch (e) {
      debugPrint('signOutAll failed: $e');
    }
    authToken.value = null;
  }

  Future<void> signOut({skipApiSignOut = false, moveToSignIn = true}) async {
    final provider = getLastSignInProvider();
    List<Future> futures = [];
    if (provider == SignInProvider.kakao) {
      futures.add(_kakaoApi.logout());
    } else if (provider == SignInProvider.naver) {
      futures.add(FlutterNaverLogin.logOut());
    }
    try {
      await Future.wait(futures);
    } catch (e) {
      debugPrint('signOut failed: $e');
    }

    authToken.value = null;

    if (moveToSignIn) {
      Get.offAllNamed("/SignIn");
    }
  }

  Future<String?> _signInWithKakao() async {
    kakao.OAuthToken authToken;
    if (await isKakaoTalkInstalled()) {
      try {
        authToken = await _kakaoApi.loginWithKakaoTalk();
      } catch (error) {
        // 사용자가 카카오톡 설치 후 디바이스 권한 요청 화면에서 로그인을 취소한 경우,
        // 의도적인 로그인 취소로 보고 카카오계정으로 로그인 시도 없이 로그인 취소로 처리 (예: 뒤로 가기)
        if (error is PlatformException && error.code == 'CANCELED') return null;

        // 카카오톡에 연결된 카카오계정이 없는 경우, 카카오계정으로 로그인
        authToken = await _kakaoApi.loginWithKakaoAccount();
      }
    } else {
      authToken = await _kakaoApi.loginWithKakaoAccount();
    }
    return authToken.accessToken;
  }

  Future<String?> _signInWithNaver() async {
    final NaverLoginResult result = await FlutterNaverLogin.logIn();

    if (result.status == NaverLoginStatus.loggedIn) {
      NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
      return token.accessToken;
    }

    return null;
  }

  Future<void> signIn(SignInProvider provider) async {
    String? token;

    switch (provider) {
      case SignInProvider.kakao:
        token = await _signInWithKakao();
        break;

      case SignInProvider.naver:
        token = await _signInWithNaver();
        break;
    }

    if (token == null) {
      Get.snackbar('로그인', '${provider.label} 로그인에 실패했습니다.', backgroundColor: Colors.white);
    } else {
      authToken.value = token;
      await _box.write('provider', provider);
    }
  }

  bool isSignedIn() {
    return authToken.value != null;
  }

  void moveAfterSignIn() async {
    Get.offAllNamed('/Pages');
  }
}
