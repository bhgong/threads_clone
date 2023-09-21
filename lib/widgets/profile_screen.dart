import 'package:flutter/material.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/feature/authentication/widgets/setting_screen.dart';
import 'package:flutter_thread_clone/utils.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends StatefulWidget {
  static const String routeName = "profile";
  static const String routeURL = "/profile";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

final tabs = ["Threads", "Replies"];

class _ProfileScreenState extends State<ProfileScreen> {
  void _onSettingTap(BuildContext context) {
    context.goNamed(
      SettingScreen.routeName,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              leading: const Icon(
                Icons.language,
              ),
              actions: [
                const FaIcon(
                  FontAwesomeIcons.instagram,
                ),
                Gaps.h20,
                GestureDetector(
                  onTap: () => _onSettingTap(context),
                  child: const FaIcon(
                    FontAwesomeIcons.bars,
                  ),
                ),
                Gaps.h20,
              ],
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: ListView(
                  children: [
                    ListTile(
                      title: const Text(
                        "Baaaang_Gong",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("baaaang_gong"),
                          Gaps.h10,
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size10,
                              vertical: Sizes.size5,
                            ),
                            child: Text(
                              "threads.net",
                              style: TextStyle(
                                color: Colors.grey.shade500,
                              ),
                            ),
                          )
                        ],
                      ),
                      trailing: const CircleAvatar(
                        backgroundImage:
                            AssetImage("lib/images/juitsu_pancake.JPG"),
                        radius: 20,
                      ),
                    ),
                    const ListTile(
                      title: Text("Love pancake!"),
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                      child: Stack(
                        children: [
                          const Positioned(
                            left: 15,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("lib/images/cat.jpeg"),
                              radius: 12,
                            ),
                          ),
                          const Positioned(
                            left: Sizes.size32,
                            child: CircleAvatar(
                              backgroundImage:
                                  AssetImage("lib/images/jinger.jpeg"),
                              radius: 12,
                            ),
                          ),
                          Positioned(
                            left: Sizes.size72,
                            child: Text(
                              "2 followers",
                              style: TextStyle(
                                color: Colors.grey.shade400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: Sizes.size96 + Sizes.size64,
                            height: Sizes.size40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Gaps.h10,
                          Container(
                            alignment: Alignment.center,
                            width: Sizes.size96 + Sizes.size80,
                            height: Sizes.size40,
                            padding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: const Text(
                              "Share Profile",
                              style: TextStyle(
                                fontSize: Sizes.size16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: TabBarDelegate(),
            ),
            SliverFillRemaining(
              // 탭바 뷰 내부에는 스크롤이 되는 위젯이 들어옴.
              hasScrollBody: true,
              child: TabBarView(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'lib/images/434x0w.jpg',
                      ),
                      radius: 15,
                    ),
                    title: Text(
                      'baaaang_gong',
                      style: TextStyle(
                        fontSize: Sizes.size14,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    subtitle: Text("i want to eat pancake!! a lot"),
                    trailing: SizedBox(
                      width: Sizes.size72,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("5h"),
                          Gaps.h10,
                          FaIcon(
                            FontAwesomeIcons.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blue,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TabBarDelegate extends SliverPersistentHeaderDelegate {
  const TabBarDelegate();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var isDark = isDarkMode(context);
    return Container(
      color: isDark ? Colors.black : Colors.white,
      child: TabBar(
        tabs: [
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: isDark ? Colors.black : Colors.white,
              child: const Text(
                "Threads",
              ),
            ),
          ),
          Tab(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              color: isDark ? Colors.black : Colors.white,
              child: const Text(
                "Replies",
              ),
            ),
          ),
        ],
        indicatorWeight: 1,
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        unselectedLabelColor: Colors.grey,
        labelColor: isDark ? Colors.white : Colors.black,
        indicatorColor: Colors.black,
        indicatorSize: TabBarIndicatorSize.tab,
        indicator: const UnderlineTabIndicator(
          insets: EdgeInsets.zero,
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        // indicatorSize: TabBarIndicatorSize.label,
      ),
    );
  }

  @override
  double get maxExtent => 48;

  @override
  double get minExtent => 48;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
