import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:purplewhale/controllers/signin_controller.dart';
import 'package:purplewhale/enums.dart';
import 'package:purplewhale/themes/app_gradients.dart';

import '../widgets/signin_button.dart';

class SignInScreen extends StatelessWidget {
  final _controller = Get.put(SignInController());

  SignInScreen({super.key});

  Widget _buildSignInButton(BuildContext context, SignInProvider provider) {
    double width = 80;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SignInButton(
                signInProvider: provider,
                onPressed: () => _controller.signIn(provider),
              ),
              Obx(() {
                if (_controller.isLoading.value && _controller.currentProvider.value == provider) {
                  // 로딩 중일 때는 CircularProgressIndicator 표시
                  return const Positioned(child: CircularProgressIndicator(strokeWidth: 6));
                } else {
                  // 로딩 중이 아닐 때는 아무것도 표시하지 않음
                  return const SizedBox.shrink();
                }
              }),
            ],
          ),
          const SizedBox(height: 3),
          Obx(() {
            bool isRecentUsed = _controller.lastSignInProvider.value == provider;
            double height = 40;
            return SizedBox(
              height: height,
              child: isRecentUsed
                  ? Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SvgPicture.asset(
                          'assets/images/recent_use_bg.svg',
                          width: width,
                          height: height,
                          fit: BoxFit.fill,
                        ),
                        const Positioned(
                          bottom: 6.5,
                          child: Text(
                            "최근 사용",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            );
          })
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // maximum 402
    double imageWidth = min(Get.width / 6 * 5, 402);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppGradients.primaryGradient,
        ),
        child: SafeArea(
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const Column(
                    children: [
                      Text(
                        'PURPLE WHALE',
                        style: TextStyle(
                          color: Color(0xFFD0CBE9),
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 4,
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        'assets/images/whale_home.png',
                        fit: BoxFit.fitWidth,
                        width: imageWidth,
                        filterQuality: FilterQuality.high,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 43,
                child: Center(
                  child: Text(
                    'SNS 계정으로 시작하세요.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              SizedBox(
                width: 320,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: SignInProvider.values.map((provider) => _buildSignInButton(context, provider)).toList()),
              ),
              const Spacer(),
            ],
          )),
        ),
      ),
    );
  }
}
