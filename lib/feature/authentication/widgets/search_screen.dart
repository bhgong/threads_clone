import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';

import 'package:flutter_thread_clone/utils.dart';

class SearchScreen extends StatefulWidget {
  static const String routeName = "search";
  static const String routeURL = "/search";
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  // int _selectedIndex = 0;
  int _followIndex = 0;

  final List<bool> _isFollow = List.filled(7, false);

  void _onFollowTap(int index) {
    setState(() {
      _followIndex = index;
      _isFollow[_followIndex] = !_isFollow[_followIndex];
    });
  }

  // void _onTap(int idx) async {
  //   switch (idx) {
  //     case 0:
  //       Navigator.of(context).pushAndRemoveUntil(
  //           MaterialPageRoute(
  //             builder: (context) => const HomeScreen(),
  //           ),
  //           (route) => false);
  //       break;

  //     case 3:
  //       Navigator.pushAndRemoveUntil(
  //           context,
  //           MaterialPageRoute(
  //             builder: (context) => const ActivityScreen(),
  //           ),
  //           (route) => false);
  //       break;
  //   }
  //   setState(() {
  //     _selectedIndex = idx;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: Sizes.size96,
          title: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Search",
                style: TextStyle(
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.start,
              ),
              Gaps.v10,
              CupertinoSearchTextField(
                autocorrect: false,
              )
            ],
          ),
        ),
        body: ListView(
          children: [
            Gaps.v1,
            searchFollowProfile(
              image: 'lib/images/juitsu_pancake.JPG',
              userId: "뱅뱅",
              subtitle: "Hello friends!!",
              isVerified: false,
              selectedIdx: 0,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("26.6K followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            searchFollowProfile(
              image: 'lib/images/434x0w.jpg',
              userId: "porsche_official",
              subtitle: "Hello friends!!",
              isVerified: true,
              selectedIdx: 1,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("102.3K followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            Gaps.v10,
            searchFollowProfile(
              image: 'lib/images/mintchoco.png',
              userId: "mintchocolate",
              subtitle: "L.O.V.E mint flavor chocolate",
              isVerified: false,
              selectedIdx: 2,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("10M followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            Gaps.v10,
            searchFollowProfile(
              image: 'lib/images/jinger.jpeg',
              userId: "jingercookie",
              subtitle: "Let's run cookieeees!!!",
              isVerified: true,
              selectedIdx: 3,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("2M followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            Gaps.v10,
            searchFollowProfile(
              image: 'lib/images/cat.jpeg',
              userId: "everycats",
              subtitle: "Meow +_+",
              isVerified: true,
              selectedIdx: 4,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("1G followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            Gaps.v10,
            searchFollowProfile(
              image: "lib/images/Flag_of_France.png",
              userId: "France_official",
              subtitle: "Bonjour~!",
              isVerified: true,
              selectedIdx: 5,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("102.3K followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
            Gaps.v10,
            searchFollowProfile(
              image: 'lib/images/pepe.png',
              userId: "pepe",
              subtitle: "Hello friends!!",
              isVerified: true,
              selectedIdx: 6,
            ),
            Gaps.v10,
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Gaps.h80,
                Gaps.h3,
                Text("123.3K followers"),
              ],
            ),
            Gaps.v10,
            const Divider(
              height: 0,
            ),
          ],
        ),
      ),
    );
  }

  ListTile searchFollowProfile({
    required String image,
    required String userId,
    required String subtitle,
    required bool isVerified,
    required int selectedIdx,
  }) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(
          image,
        ),
        radius: 25,
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
        ],
      ),
      subtitle: Text(subtitle),
      trailing: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size24,
          vertical: Sizes.size8,
        ),
        decoration: BoxDecoration(
          color: _isFollow[selectedIdx]
              ? Colors.blueGrey.shade400
              : isDarkMode(context)
                  ? null
                  : Colors.white,
          border: Border.all(
            width: 1,
            color: Colors.grey.shade400,
          ),
          borderRadius: BorderRadius.circular(
            10,
          ),
        ),
        child: GestureDetector(
          onTap: () => _onFollowTap(selectedIdx),
          child: _isFollow[selectedIdx]
              ? Text(
                  "Following",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    backgroundColor: //isDarkMode(context)
                        Colors.blueGrey.shade400,
                    // : Colors.white,
                    color: //isDarkMode(context)
                        // ? Colors.blueGrey.shade400
                        Colors.white,
                  ),
                )
              : const Text(
                  "Follow",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
        ),
      ),
    );
  }
}
