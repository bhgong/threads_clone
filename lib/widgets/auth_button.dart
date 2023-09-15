import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

typedef TapRouteFunction = void Function();
// typedef GestureTapCallback = void Function();

class AuthButton extends StatelessWidget {
  final String text;
  final FaIcon? icon;
  final Color buttonColor;
  final Color textColor;
  // final TapRouteFunction? onTapRoute; // for Code Challenge
  // final GestureDetector onTap;

  const AuthButton({
    super.key,
    required this.text,
    this.icon,
    required this.buttonColor,
    required this.textColor,
    // this.onTapRoute, // for Code Challenge
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        // clipBehavior: ,
        padding: const EdgeInsets.all(
          Sizes.size14,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: buttonColor,
          border: Border.all(
            color: Colors.grey.shade300,
            width: Sizes.size2,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // alignment: Alignment.center, // layout 들을 center로 align하겠다는 의미
          children: [
            Align(
              // Align하는 위젯인데 icon에 대해서 centerLeft정렬 해주도록 설정
              alignment: Alignment.center,
              child: icon,
            ),
            const SizedBox(
              width: Sizes.size12,
            ),
            Text(
              text,
              style: TextStyle(
                fontSize: Sizes.size16 + Sizes.size2,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
