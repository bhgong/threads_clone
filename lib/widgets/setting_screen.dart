import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
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
