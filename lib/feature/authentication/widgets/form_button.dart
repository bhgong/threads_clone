import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/utils.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.disabled,
    this.text,
  });

  final bool disabled;
  final String? text;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = isDarkMode(context);
    return SizedBox(
      width: size.width,
      height: 60,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: (text == "Forgot password?")
                ? Colors.transparent
                : Colors.grey.shade400,
          ),
          color: disabled ? null : Theme.of(context).primaryColor,
        ),
        child: AnimatedDefaultTextStyle(
          duration: const Duration(milliseconds: 500),
          style: TextStyle(
            color: disabled
                ? isDark
                    ? null
                    : Colors.black
                : Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: Sizes.size20 - Sizes.size2,
          ),
          child: Text(
            "$text",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
