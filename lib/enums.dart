enum SignInProvider {
  kakao,
  naver,
}

extension SignInProviderExtension on SignInProvider {
  String get label {
    switch (this) {
      case SignInProvider.kakao:
        return '카카오';
      case SignInProvider.naver:
        return '네이버';
    }
  }
}
