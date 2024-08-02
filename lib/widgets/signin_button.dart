import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:purplewhale/enums.dart';

class SignInButton extends StatelessWidget {
  final SignInProvider signInProvider;
  final VoidCallback onPressed;

  const SignInButton({
    Key? key,
    required this.signInProvider,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05), // Fill color with 5% transparency
          shape: BoxShape.circle,
          border: Border.all(
            color: Colors.white.withOpacity(0.3), // Border color with 30% transparency
            width: 1,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/images/${signInProvider.name}.svg',
            width: 20,
            height: 20,
          ),
        ),
      ),
    );
  }
}
