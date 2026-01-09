import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFF28214E);
  static const Color primary = Color(0xFF784BEF);
  static const Color primaryContrast = Color(0xFFFFFFFF);
  static const Color primaryNormal = Color(0xFF731BFF);
  static const Color button = Color(0xFF6C63FF);
  static const Color button1 = Color(0xFF784BEF);
  static const Color button2 = Color(0xFFE7BBFF);
  static const Color button3 = Color(0xFF0AF9E2);
  static const Color optionNotSelected = Color(0xFF322C52);
  static const Color thumbColor = Color(0xFFAA68FF);
  static const Color greyButton = Color(0xFF5B5377);
  static const Color darkBackground = Color(0xFF1E183D);
  static const Color lightGrey = Color(0xFFDADADA);
  static const Color modalBackground = Color(0xFFF3F1FA);
  static const Color modalBarrierColor = Color.fromRGBO(0, 0, 0, 0.7);
  static const Color leadGrey = Color(0xFF666666);
  static const Color warning = Color(0xFFFF5A89);
  static const Color aqua = Color(0XFF55F5FF);
  static const Color missionPink = Color(0XFFD384FF);
  static const Color missionBlue = Color(0XFF5D35FF);
  static const Color missionBlack = Color(0XFF322C52);
}

const TextTheme textTheme = TextTheme(
  titleMedium:
      TextStyle(color: AppColors.primaryContrast, fontSize: 20.0, height: 27.24 / 20, fontWeight: FontWeight.w700),
  titleSmall:
      TextStyle(color: AppColors.primaryContrast, fontSize: 16.0, height: 21.79 / 16, fontWeight: FontWeight.w700),
  bodyLarge: TextStyle(color: AppColors.primaryContrast, fontSize: 16.0, height: 24 / 16, letterSpacing: 0.0),
  bodyMedium: TextStyle(color: AppColors.primaryContrast, fontSize: 14.0, height: 20 / 14, letterSpacing: 0.0),
  bodySmall: TextStyle(color: AppColors.primaryContrast, letterSpacing: 0.0),
);

final ThemeData appTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    background: AppColors.background,
  ),
  fontFamily: 'Inter',
  textTheme: textTheme,
  dialogTheme: const DialogThemeData(
    backgroundColor: AppColors.background,
    surfaceTintColor: Colors.transparent,
    titleTextStyle: TextStyle(
      color: AppColors.primaryContrast,
      fontWeight: FontWeight.w700,
      fontSize: 20.0,
      height: 27.24 / 20,
    ),
    contentTextStyle: TextStyle(
      color: AppColors.primaryContrast,
      fontSize: 14,
      height: 19 / 14,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.primaryContrast,
    ),
  ),
  snackBarTheme: const SnackBarThemeData(
    backgroundColor: AppColors.primaryContrast,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: AppColors.button,
    textTheme: ButtonTextTheme.normal,
  ),
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.primaryContrast),
    backgroundColor: AppColors.background,
    titleTextStyle: TextStyle(
      color: AppColors.primaryContrast,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  actionIconTheme: ActionIconThemeData(
    backButtonIconBuilder: (BuildContext context) => const ImageIcon(
      AssetImage('assets/images/btn_chevron_left.png'),
      size: 40.0,
    ),
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.transparent),
);

class TextThemeHelper {
  static TextStyle titleMedium(BuildContext context) => Theme.of(context).textTheme.titleMedium!;
}
