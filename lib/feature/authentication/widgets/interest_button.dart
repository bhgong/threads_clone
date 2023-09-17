import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/feature/screens/interests_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../../constants/sizes.dart';

class InterestButton extends StatefulWidget {
  const InterestButton({
    super.key,
    required this.interest,
    required this.notifySelInfo,
  });

  final String interest;
  final Function notifySelInfo;

  @override
  State<InterestButton> createState() => _InterestButtonState();
}

class _InterestButtonState extends State<InterestButton> {
  bool _isSelected = false;

  int idx = 0;

  void _onTap() {
    // print(interests.indexOf(widget.interest));
    idx = interests.indexOf(widget.interest);

    widget.notifySelInfo(idx);
    setState(() {
      _isSelected = !_isSelected;
    });

    // return selectedCount;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedContainer(
        width: 180,
        height: 80,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: _isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(
            Sizes.size10,
          ),
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        child: Column(
          children: [
            Gaps.v10,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _isSelected
                    ? const FaIcon(
                        FontAwesomeIcons.solidCircleCheck,
                        color: Colors.white,
                        size: Sizes.size16,
                      )
                    : const SizedBox(
                        height: 18,
                      ),
                Gaps.h10,
              ],
            ),
            Gaps.v16,
            Gaps.v2,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Gaps.h10,
                Text(
                  widget.interest,
                  style: TextStyle(
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.bold,
                    color: _isSelected ? Colors.white : Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
