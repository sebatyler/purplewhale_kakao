import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purplewhale/services/auth_service.dart';
import 'package:purplewhale/services/env_config.dart';
import 'package:purplewhale/services/page_service.dart';
import 'package:purplewhale/themes/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EnvConfig.init();
  await GetStorage.init();

  Get.put(AuthService().init());
  Get.lazyPut(() => PageService().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return _limitedWidthLayout(
      child: GetMaterialApp(
        title: 'Purple Whale',
        initialRoute: "/",
        theme: appTheme,
        getPages: Get.find<PageService>().pages,
      ),
    );
  }

  Widget _limitedWidthLayout({required Widget child}) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 806),
        child: child,
      ),
    );
  }
}
