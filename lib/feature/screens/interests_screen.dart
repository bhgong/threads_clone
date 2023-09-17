import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/form_button.dart';

import 'package:flutter_thread_clone/widgets/interest_button.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const interests = [
  "Music",
  "Fashion & Beauty",
  "Outdoors",
  "Travel",
  "Arts & culture",
  "Entertainment",
  "Animation & comics",
  "Animals",
  "Travel",
  "Food",
  "Drama",
  "Learning",
  "Talent",
  "Sports",
  "Auto",
  "Family",
  "Arts & Crafts",
  "Dance",
  "Outdoors",
  "Oddly Satisfying",
  "Home & Garden",
  "Daily Life",
];

class InterestsScreen extends StatefulWidget {
  static const String routeName = "interests";
  static const String routeURL = "/tutorial";

  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;
  bool _isSelected = false;

  void _onScroll() {
    if (_scrollController.offset > 100) {
      if (_showTitle) return;
      setState(() {
        _showTitle = true;
      });
    } else {
      setState(() {
        _showTitle = false;
      });
    }
  }

  final _selectedButton = List.filled(interests.length, false);
  var count = 0;
  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const Placeholder(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void getButtonSelInfo(int idx) {
    _selectedButton[idx] = !_selectedButton[idx];
    if (_selectedButton[idx]) {
      count++;
    } else {
      count--;
    }
    // if (count == 3) {
    setState(() {
      count;
      if (count == 3) {
        _isSelected = !_isSelected;
      }
    });
    // }
    // count 가 3개 이상일때 예외처리
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        controller: _scrollController,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Padding(
            padding: const EdgeInsets.only(
              left: Sizes.size24,
              right: Sizes.size24,
              bottom: Sizes.size16,
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.twitter,
                        color: Color(0xFF4F98E9),
                        size: 35,
                      ),
                    ],
                  ),
                  Gaps.v40,
                  const Text(
                    "What do you want to see on Twitter?",
                    style: TextStyle(
                      fontSize: Sizes.size28,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Gaps.v20,
                  const Text(
                    "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                    style: TextStyle(
                      fontSize: Sizes.size16 + Sizes.size2,
                    ),
                  ),
                  Gaps.v14,
                  SizedBox(
                      width: 500,
                      child:
                          Divider(color: Colors.grey.shade400, thickness: 0.5)),
                  Gaps.v48,
                  Wrap(
                    runSpacing: 15,
                    spacing: 15,
                    children: [
                      for (var interest in interests)
                        InterestButton(
                          interest: interest,
                          notifySelInfo: getButtonSelInfo,
                        )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: Sizes.size20,
            top: Sizes.size10,
            left: Sizes.size24,
            right: Sizes.size24,
          ),
          child: GestureDetector(
            onTap: _onNextTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                !_isSelected
                    ? const Text("Great work!! 🎉")
                    : Text(
                        "$count of 3 selected",
                        style: TextStyle(
                          color: Colors.grey.shade400,
                        ),
                      ),
                Gaps.h44,
                FormButton(
                  disabled: !_isSelected,
                  text: "Next",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
