import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.4,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.size14),
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Scrollbar(
              child: ListView(
                children: <Widget>[
                  Gaps.v10,
                  ListTile(
                    title: Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(),
                      ),
                      child: const Text(
                        "Report",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  ListTile(
                    minVerticalPadding: 20,
                    title: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                      ),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.horizontal(),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Why are you reporting this thread?",
                            style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600),
                          ),
                          RichText(
                            text: TextSpan(
                              text:
                                  "Your report is anonymous, except if you're reporting an intellectual property infringement. If someone is in immediate danger, call the local emergency services - don't wait.",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    height: 0,
                  ),
                  reportList("I just don't like it"),
                  const Divider(
                    height: 0,
                  ),
                  reportList("It's unlawful content under NetzDG"),
                  const Divider(
                    height: 0,
                  ),
                  reportList("It's spam"),
                  const Divider(
                    height: 0,
                  ),
                  reportList("Hate speech or symbols"),
                  const Divider(
                    height: 0,
                  ),
                  reportList("Nudity or sexual activity"),
                  const Divider(
                    height: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile reportList(String text) {
    return ListTile(
      title: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size12,
        ),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.horizontal(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: Sizes.size20,
                fontWeight: FontWeight.w400,
              ),
            ),
            const FaIcon(
              FontAwesomeIcons.chevronRight,
            ),
          ],
        ),
      ),
    );
  }
}
