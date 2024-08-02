import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class WhaleIllustWidget extends StatelessWidget {
  const WhaleIllustWidget({super.key, this.num});

  final int? num;

  @override
  Widget build(BuildContext context) {
    final heights = [91.0, 64.21, 154.0, 15.39, 144.0, 87.0, 42.0];
    final heightIndex = num ?? Random().nextInt(heights.length);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: heights[heightIndex]),
          Flexible(
            child: Image.asset(
              'assets/images/whale_illust_$heightIndex.png',
              fit: BoxFit.fitWidth,
              width: Get.width,
              filterQuality: FilterQuality.high,
            ),
          ),
        ],
      ),
    );
  }
}
