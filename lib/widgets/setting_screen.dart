import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/home_screen.dart';
import 'package:flutter_thread_clone/widgets/activity_screen.dart';
import 'package:flutter_thread_clone/widgets/nav_tab.dart';
import 'package:flutter_thread_clone/widgets/privacy_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class SettingScreen extends StatefulWidget {
  static const String routeName = "settings";
  static const String routeURL = "/settings";
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  int _selectedIndex = 0;

  void _onBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onPrivacyTap(BuildContext context) {
    context.goNamed(
      // MaterialPageRoute(
      //   builder: (context) => const PrivacyScreen(),
      // ),
      PrivacyScreen.routeName,
    );
  }

  void _onTap(int idx) async {
    switch (idx) {
      case 0:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
            (route) => false);
        break;

      case 3:
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const ActivityScreen(),
            ),
            (route) => false);
        break;
    }
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          leadingWidth: 90,
          leading: GestureDetector(
            onTap: () => _onBackButton(context),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h14,
                FaIcon(
                  FontAwesomeIcons.chevronLeft,
                ),
                Gaps.h5,
                Text(
                  "Back",
                  style: TextStyle(
                    fontSize: Sizes.size16,
                  ),
                ),
              ],
            ),
          ),
          title: const Text(
            "Settings",
            style: TextStyle(
              fontSize: Sizes.size20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size20,
          ),
          children: [
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.userPlus,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "Follow and invite friends",
                isListTile: false,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.volumeHigh,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "Notifications",
                isListTile: false,
              ),
            ),
            ListTile(
              onTap: () => _onPrivacyTap(context),
              leading: const FaIcon(
                FontAwesomeIcons.lock,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "Privacy",
                isListTile: false,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.circleUser,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "Account",
                isListTile: false,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.solidLifeRing,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "Help",
                isListTile: false,
              ),
            ),
            ListTile(
              leading: const FaIcon(
                FontAwesomeIcons.circleInfo,
                // color: Colors.black,
                size: Sizes.size24,
              ),
              title: tileLists(
                text: "About",
                isListTile: false,
              ),
            ),
            const Divider(
              thickness: 1,
            ),

            ListTile(
              title: const Text(
                "Log out",
                style: TextStyle(
                  fontSize: Sizes.size20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF4995DF),
                ),
              ),
              onTap: () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    title: const Text("Are you sure?"),
                    content: const Text("Please don't go..."),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "No",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      CupertinoDialogAction(
                        isDestructiveAction: true,
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text(
                          "Yes",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            // GestureDetector(
            //   onTap: ,
            //   child: Container(
            //     padding: const EdgeInsets.symmetric(
            //       horizontal: Sizes.size14,
            //       vertical: Sizes.size10,
            //     ),
            //     width: MediaQuery.of(context).size.width,
            //     child: const Row(
            //       children: [
            //         Text(
            //           "Log out",
            //           style: TextStyle(
            //             fontSize: Sizes.size20,
            //             fontWeight: FontWeight.w500,
            //             color: Color(0xFF4995DF),
            //           ),
            //         ),
            //         Spacer(),

            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
        // bottomNavigationBar: BottomAppBar(
        //   child: Padding(
        //     padding: const EdgeInsets.only(
        //       bottom: Sizes.size32,
        //       top: Sizes.size32,
        //       left: Sizes.size24,
        //       right: Sizes.size24,
        //     ),
        //     child: Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceAround,
        //       children: [
        //         NavTab(
        //           isSelected: _selectedIndex == 0,
        //           icon: FontAwesomeIcons.house,
        //           onTap: () => _onTap(0),
        //         ),
        //         NavTab(
        //           isSelected: _selectedIndex == 1,
        //           icon: FontAwesomeIcons.magnifyingGlass,
        //           onTap: () => _onTap(1),
        //         ),
        //         NavTab(
        //           isSelected: _selectedIndex == 2,
        //           icon: FontAwesomeIcons.penToSquare,
        //           onTap: () => _onTap(2),
        //         ),
        //         NavTab(
        //           isSelected: _selectedIndex == 3,
        //           icon: FontAwesomeIcons.heart,
        //           onTap: () => _onTap(3),
        //         ),
        //         NavTab(
        //           isSelected: _selectedIndex == 4,
        //           icon: FontAwesomeIcons.user,
        //           onTap: () => _onTap(4),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ),
    );
  }

  Row tileLists({
    required String text,
    required bool isListTile,
  }) {
    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(
            // color: Colors.black,
            fontSize: Sizes.size20,
          ),
        ),
        const Spacer(),
        text == "Mentions"
            ? Text(
                "Everyone   ",
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: Sizes.size20,
                ),
              )
            : const SizedBox(),
        isListTile
            ? FaIcon(
                FontAwesomeIcons.chevronRight,
                color: Colors.grey.shade500,
              )
            : const SizedBox(),
      ],
    );
  }
}
