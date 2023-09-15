import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/home_screen.dart';
import 'package:flutter_thread_clone/utils.dart';
import 'package:flutter_thread_clone/widgets/search_screen.dart';

final tabs = [
  "All",
  "Replies",
  "Mentions",
  "Follows",
];

class ActivityScreen extends StatefulWidget {
  static const String routeName = "activity";
  static const String routeURL = "/activity";
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int _followIndex = 0;
  late TabController _tabController;

  final List<bool> _isFollow = List.filled(7, false);
  List<bool> _isSelectedTap = List.filled(tabs.length, false);
  int _activeTabIndex = 0;

  @override
  void initState() {
    _isSelectedTap[0] = true;
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
    super.initState();
  }

  void _handleTabSelection() {
    _isSelectedTap = List.filled(tabs.length, false);
    setState(() {
      _activeTabIndex = _tabController.index;
      _isSelectedTap[_activeTabIndex] = true;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onFollowTap(int index) {
    setState(() {
      _followIndex = index;
      _isFollow[_followIndex] = !_isFollow[_followIndex];
    });
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
      case 1:
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => const SearchScreen(),
            ),
            (route) => false);
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Placeholder(),
          ),
        );
        break;
    }
    setState(() {
      _selectedIndex = idx;
    });
  }

  @override
  Widget build(BuildContext context) {
    var isDark = isDarkMode(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: Sizes.size80,
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Activity",
                  style: TextStyle(
                    fontSize: Sizes.size32,
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            titleSpacing: 20,
            bottom: TabBar(
              controller: _tabController,
              isScrollable: true,
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
              ),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              indicatorColor: Colors.black,
              // labelColor: Colors.white,
              labelStyle: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w600,
                // color: Colors.white,
              ),
              labelPadding: const EdgeInsets.symmetric(
                horizontal: Sizes.size3,
              ),
              unselectedLabelColor: isDark ? Colors.white : Colors.black,
              unselectedLabelStyle: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.w500,
              ),

              tabs: [
                for (int idx = 0; idx < tabs.length; idx++)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    width: 120,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey.shade400,
                      ),
                      borderRadius: BorderRadius.circular(
                        Sizes.size14,
                      ),
                      color: _isSelectedTap[idx]
                          ? Colors.black
                          : isDark
                              ? Colors.grey.shade500
                              : Colors.white,
                    ),
                    child: Tab(
                      text: tabs[idx],
                    ),
                  ),
              ],
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.all(0),
            children: [
              Gaps.v1,
              searchActivityProfile(
                image: 'lib/images/juitsu_pancake.JPG',
                userId: "뱅뱅",
                whenActive: "2h",
                subtitle: "Mentioned you",
                isVerified: false,
                selectedIdx: 0,
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.h80,
                  Gaps.h3,
                  SizedBox(
                    width: 300,
                    child: Text(
                      "Here's thread you should follow if you love botany @뱅뱅",
                    ),
                  ),
                ],
              ),
              Gaps.v10,
              const Divider(
                height: 0,
              ),
              searchActivityProfile(
                image: "lib/images/Flag_of_France.png",
                userId: "France_official",
                whenActive: "5h",
                subtitle: "Bon voyage~ 🛫 🗼",
                isVerified: true,
                selectedIdx: 5,
              ),
              const Divider(
                height: 0,
              ),
              searchActivityProfile(
                image: 'lib/images/mintchoco.png',
                userId: "mintchocolate",
                whenActive: "3h",
                subtitle: "Followed you",
                isVerified: false,
                selectedIdx: 2,
              ),
              const Divider(
                height: 0,
              ),
              searchActivityProfile(
                image: 'lib/images/jinger.jpeg',
                userId: "jingercookie",
                whenActive: "3h",
                subtitle: "Definitely broken 😂",
                isVerified: true,
                selectedIdx: 3,
              ),
              const Divider(
                height: 0,
              ),
              searchActivityProfile(
                image: 'lib/images/cat.jpeg',
                userId: "everycats",
                whenActive: "3h",
                subtitle: "Meow +_+ 😘😘😘",
                isVerified: true,
                selectedIdx: 4,
              ),
              const Divider(
                height: 0,
              ),
              searchActivityProfile(
                image: 'lib/images/434x0w.jpg',
                userId: "porsche_official",
                whenActive: "1h 30m",
                subtitle: "Hello friends!!",
                isVerified: true,
                selectedIdx: 1,
              ),
              const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Gaps.h80,
                  Gaps.h3,
                  Text(
                    "New car on market! 🏎️",
                  ),
                ],
              ),
              Gaps.v10,
            ],
          ),
        ),
      ),
    );
  }

  ListTile searchActivityProfile({
    required String image,
    required String userId,
    required String whenActive,
    required subtitle,
    required bool isVerified,
    required int selectedIdx,
  }) {
    return ListTile(
      leading: Stack(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(
              image,
            ),
            radius: 25,
          ),
          Positioned(
              bottom: 100,
              left: 30,
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    50,
                  ),
                  color: Colors.black,
                ),
              ))
        ],
      ),
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            userId,
            style: const TextStyle(
              fontSize: Sizes.size14,
              fontWeight: FontWeight.w600,
            ),
          ),
          Gaps.h5,
          isVerified
              ? Center(
                  child: SvgPicture.asset(
                    'lib/images/google-verified-seeklogo.com.svg',
                    width: 15,
                    height: 15,
                  ),
                )
              : const SizedBox(),
          Gaps.h5,
          Text(
            whenActive,
            style: const TextStyle(
              fontSize: Sizes.size14,
            ),
          ),
        ],
      ),
      subtitle: Text(subtitle),

      // Text(subtitle),
      // trailing: Container(
      //   padding: const EdgeInsets.symmetric(
      //     horizontal: Sizes.size24,
      //     vertical: Sizes.size8,
      //   ),
      //   decoration: BoxDecoration(
      //     color:
      //         _isFollow[selectedIdx] ? Colors.blueGrey.shade300 : Colors.white,
      //     border: Border.all(
      //       width: 1,
      //       color: _isFollow[selectedIdx]
      //           ? Colors.blueGrey.shade300
      //           : Colors.white,
      //     ),
      //     borderRadius: BorderRadius.circular(
      //       10,
      //     ),
      //   ),
      //   child: GestureDetector(
      //     onTap: () => _onFollowTap(selectedIdx),
      //     child: _isFollow[selectedIdx]
      //         ? Text(
      //             "Following",
      //             style: TextStyle(
      //               fontWeight: FontWeight.w500,
      //               backgroundColor: Colors.blueGrey.shade300,
      //               color: Colors.white,
      //             ),
      //           )
      //         : const SizedBox(),
      //   ),
      // ),
    );
  }
}
