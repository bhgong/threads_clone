import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/utils.dart';
import 'package:flutter_thread_clone/widgets/viewModel/dark_mode_view_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PrivacyScreen extends ConsumerWidget {
  static const String routeName = "privacy";
  static const String routeURL = "privacy";
  const PrivacyScreen({super.key});

  final bool _notification = false;

  // void _onChangedSwitch(bool? newValue) {
  void _onBackButton(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDark = isDarkMode(context);
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
            "Privacy",
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
            SwitchListTile(
              value: _notification,
              onChanged: (value) => {}, //_onChangedSwitch,
              inactiveTrackColor: Colors.grey.shade400,
              activeColor: Colors.white,
              activeTrackColor:
                  isDark ? Colors.blueGrey.shade500 : Colors.black,
              title: tileLists(
                text: "Private profile",
                icon: const FaIcon(
                  Icons.lock_outline,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: false,
              ),
            ),
            SwitchListTile.adaptive(
              value: ref.watch(darkModeProvider).isDark,
              onChanged: (value) =>
                  ref.read(darkModeProvider.notifier).setDarkMode(value),
              inactiveTrackColor: Colors.grey.shade400,
              activeColor: Colors.white,
              activeTrackColor:
                  isDark ? Colors.blueGrey.shade500 : Colors.black,
              title: tileLists(
                text: "Dark Mode",
                icon: const FaIcon(
                  FontAwesomeIcons.solidMoon,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: false,
              ),
            ),
            ListTile(
              title: tileLists(
                text: "Mentions",
                icon: const FaIcon(
                  Icons.mode_comment_outlined,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: true,
              ),
            ),
            ListTile(
              title: tileLists(
                text: "Muted",
                icon: const FaIcon(
                  FontAwesomeIcons.volumeXmark,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: true,
              ),
            ),
            ListTile(
              title: tileLists(
                text: "Hidden Words",
                icon: const FaIcon(
                  FontAwesomeIcons.eyeSlash,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: true,
              ),
            ),
            ListTile(
              title: tileLists(
                text: "Profiles you follow",
                icon: const FaIcon(
                  FontAwesomeIcons.userGroup,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: true,
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size20,
                vertical: Sizes.size14,
              ),
              child: RichText(
                text: TextSpan(
                  text: "Other privacy settings\n",
                  style: TextStyle(
                    fontSize: Sizes.size24,
                    fontWeight: FontWeight.w700,
                    color: isDark ? null : Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          "\nSome settings, like restrict, apply to both Threads and Instagram and can be managed on Instagram.",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ListTile(
              trailing: const FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
              ),
              title: tileLists(
                text: "Block Profiles",
                icon: const FaIcon(
                  FontAwesomeIcons.circleXmark,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: false,
              ),
            ),
            ListTile(
              trailing: const FaIcon(
                FontAwesomeIcons.arrowUpRightFromSquare,
              ),
              title: tileLists(
                text: "Hide likes",
                icon: const FaIcon(
                  FontAwesomeIcons.heartCircleXmark,
                  // color: Colors.black,
                  size: Sizes.size24,
                ),
                isListTile: false,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row tileLists({
    required String text,
    required FaIcon icon,
    required bool isListTile,
  }) {
    return Row(
      children: [
        icon,
        Gaps.h16,
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
