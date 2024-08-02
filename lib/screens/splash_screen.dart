import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:purplewhale/services/auth_service.dart';
import 'package:purplewhale/themes/app_gradients.dart';
import 'package:purplewhale/widgets/whale_illust_widget.dart';

class SplashScreen extends StatelessWidget {
  final AuthService authService = Get.find();

  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.microtask(() {
      if (authService.isSignedIn()) {
        authService.moveAfterSignIn();
      } else {
        Get.offAllNamed('/SignIn');
      }
    });

    // Return a splash screen widget here
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.primaryGradient,
          ),
          child: Column(
            children: [
              const SizedBox(height: 102),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: Get.mediaQuery.padding.top),
                    const Text(
                      'PURPLE WHALE',
                      style: TextStyle(
                        color: Color(0xFFD0CBE9),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      '퍼플웨일',
                      style: TextStyle(
                        color: Color(0xFF7C6CCC),
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 12,
                      ),
                    ),
                  ],
                ),
              ),
              const WhaleIllustWidget(num: 3),
            ],
          ),
        ),
      ),
    );
  }
}
