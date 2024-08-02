import 'package:get/get.dart';
import 'package:purplewhale/screens/signin_screen.dart';
import 'package:purplewhale/screens/splash_screen.dart';
import 'package:purplewhale/screens/pages_screen.dart';

class PageService extends GetxService {
  late List<GetPage> pages;

  PageService init() {
    pages = [
      GetPage(name: '/', page: () => SplashScreen()),
      GetPage(name: '/SignIn', page: () => SignInScreen()),
      GetPage(name: '/Pages', page: () => PagesScreen()),
    ]..sort((a, b) => a.name.compareTo(b.name));

    return this;
  }
}
