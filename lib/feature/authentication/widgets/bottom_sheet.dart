import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/report_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {
  void _onReportTap(BuildContext context) async {
    // await showModalBottomSheet(
    //   showDragHandle: true,
    //   clipBehavior: Clip.hardEdge,
    //   context: context,
    //   builder: (context) => const ReportScreen(),
    // );
    await Navigator.of(context).pushReplacement(
      ModalBottomSheetRoute(
        showDragHandle: true,
        clipBehavior: Clip.hardEdge,
        builder: (context) => const ReportScreen(),
        isScrollControlled: true,
      ),
    );
  }

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
                  Gaps.v32,
                  ListTile(
                    minVerticalPadding: 0,
                    title: Container(
                      height: 54,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: const Text(
                        "Unfollow",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 397,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  ListTile(
                    minVerticalPadding: 0,
                    title: Container(
                      height: 54,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: const Text(
                        "Mute",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v20,
                  ListTile(
                    minVerticalPadding: 0,
                    title: Container(
                      height: 54,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: const Text(
                        "Hide",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 397,
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                    ],
                  ),
                  // SizedBox(
                  //   width: 300,
                  //   height: 0,
                  //   child: Divider(
                  //     // height: 0,
                  //     color: Colors.grey.shade400,
                  //     thickness: 1,
                  //   ),
                  // ),
                  ListTile(
                    minVerticalPadding: 0,
                    onTap: () => _onReportTap(context),
                    title: Container(
                      height: 54,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                        color: Colors.grey.shade200,
                      ),
                      child: const Text(
                        "Report",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.w600,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
