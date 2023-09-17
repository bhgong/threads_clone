import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';

typedef TapRouteFunction = void Function();
// typedef GestureTapCallback = void Function();

class CustomButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color textColor;
  final bool disabled;

  const CustomButton({
    super.key,
    required this.text,
    required this.disabled,
    required this.buttonColor,
    required this.textColor,
    // this.onTapRoute, // for Code Challenge
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 350,
      padding: const EdgeInsets.all(
        Sizes.size20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: disabled ? buttonColor : const Color(0xFF86898B),
        border: Border.all(
          color: Colors.grey.shade300,
          width: Sizes.size2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // alignment: Alignment.center, // layout 들을 center로 align하겠다는 의미
        children: [
          const SizedBox(
            width: Sizes.size12,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w800,
              color: disabled ? textColor : Colors.grey.shade400,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
