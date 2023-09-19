import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_thread_clone/constants/gaps.dart';
import 'package:flutter_thread_clone/constants/sizes.dart';
import 'package:flutter_thread_clone/utils.dart';
import 'package:flutter_thread_clone/widgets/bottom_sheet.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home";
  static const String routeURL = "/";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final screens = [
    const Center(
      child: Text(
        'Home',
        style: TextStyle(fontSize: 49),
      ),
    ),
    const Center(
      child: Text(
        'Search',
        style: TextStyle(fontSize: 49),
      ),
    ),
    const Center(
      child: Text(
        'Write New',
        style: TextStyle(fontSize: 49),
      ),
    ),
    const Center(
      child: Text(
        'Likes',
        style: TextStyle(fontSize: 49),
      ),
    ),
    const Center(
      child: Text(
        'User',
        style: TextStyle(fontSize: 49),
      ),
    ),
  ];
  final ScrollController _scrollController = ScrollController();

  bool _showTitle = false;

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

  var count = 0;

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

  void _onBottomTap(BuildContext context) async {
    await showModalBottomSheet(
      showDragHandle: true,
      clipBehavior: Clip.hardEdge,
      context: context,
      builder: (context) => const BottomScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: isDarkMode(context)
            ? Center(
                child: SvgPicture.asset(
                  'lib/images/threads-app-icon.svg',
                  width: 40,
                  height: 40,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size10,
                  vertical: Sizes.size10,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'lib/images/threads.svg',
                    width: 30,
                    height: 30,
                  ),
                ),
              ),
      ),
      body: Scrollbar(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(
            left: Sizes.size10,
            right: Sizes.size10,
            bottom: Sizes.size16,
          ),
          child: ListView(
            children: [
              ListTile(
                minLeadingWidth: size.width / 10,
                leading: const SizedBox(
                  width: 60,
                  height: 80,
                  child: Stack(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'lib/images/434x0w.jpg',
                        ),
                        radius: 25,
                      ),
                      Positioned(
                        top: 30,
                        left: 30,
                        child: FaIcon(
                          FontAwesomeIcons.circlePlus,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                title: Container(
                  alignment: Alignment.topLeft,
                  // width: size.width / 8,
                  height: size.height / 20,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Porsche',
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Gaps.h5,
                      Center(
                        child: SvgPicture.asset(
                          'lib/images/google-verified-seeklogo.com.svg',
                          width: 15,
                          height: 15,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        '2m',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: Sizes.size16,
                        ),
                      ),
                      Gaps.h10,
                      GestureDetector(
                        onTap: () => _onBottomTap(context),
                        child: const FaIcon(
                          FontAwesomeIcons.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: Container(
                  alignment: Alignment.topLeft,
                  width: size.width,
                  child: const Text(
                    'A new SUV positioned above the Macan and Cayenne.',
                    style: TextStyle(
                      fontSize: Sizes.size16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              IntrinsicHeight(
                child: Row(
                  children: [
                    Gaps.h16,
                    VerticalDivider(
                      color: Colors.grey.shade300,
                      thickness: 3,
                      width: 10,
                    ),
                    Gaps.h32,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size40,
                          ),
                          width: 300,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              40,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(
                                  'lib/images/porsche_electric_105.jpg'),
                            ),
                          ),
                        ),
                        Gaps.v20,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(FontAwesomeIcons.heart),
                            Gaps.h10,
                            FaIcon(FontAwesomeIcons.message),
                            Gaps.h10,
                            FaIcon(FontAwesomeIcons.arrowRotateRight),
                            Gaps.h10,
                            FaIcon(FontAwesomeIcons.paperPlane),
                            Gaps.h10,
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.v20,
              const Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: [
                        Positioned(
                          top: 10,
                          left: 0,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/images/cat.jpeg',
                            ),
                            radius: 9,
                          ),
                        ),
                        Positioned(
                          top: 5,
                          left: 20,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/images/jinger.jpeg',
                            ),
                            radius: 10,
                          ),
                        ),
                        Positioned(
                          top: 30,
                          left: 10,
                          child: CircleAvatar(
                            backgroundImage: AssetImage(
                              'lib/images/mintchoco.png',
                            ),
                            radius: 8,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('36 replies • 391 likes'),
                ],
              ),
              SizedBox(
                width: 500,
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                ),
              ),
              //     Gaps.v20,
              //     const Row(
              //       children: [
              //         SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Stack(
              //             children: [
              //               CircleAvatar(
              //                 backgroundImage: AssetImage(
              //                   'lib/images/mintchoco.png',
              //                 ),
              //                 radius: 25,
              //               ),
              //               Positioned(
              //                 top: 40,
              //                 left: 40,
              //                 child: FaIcon(
              //                   FontAwesomeIcons.circlePlus,
              //                   size: 10,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Gaps.h20,
              //         SizedBox(
              //           width: 300,
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   Text(
              //                     'Baaaang_gong',
              //                     style: TextStyle(
              //                       fontSize: Sizes.size16,
              //                       fontWeight: FontWeight.w700,
              //                     ),
              //                   ),
              //                   Gaps.h20,
              //                   Gaps.h40,
              //                   Gaps.h48,
              //                   Text(
              //                     '7h',
              //                     style: TextStyle(
              //                       color: Colors.grey,
              //                       fontSize: Sizes.size16 + Sizes.size2,
              //                     ),
              //                   ),
              //                   Gaps.h20,
              //                   FaIcon(
              //                     FontAwesomeIcons.ellipsis,
              //                   )
              //                 ],
              //               ),
              //               Row(
              //                 children: [
              //                   SizedBox(
              //                     width: 300,
              //                     height: 50,
              //                     child: Text(
              //                       '아 베라 민트초코 먹고싶다...',
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: Sizes.size16,
              //                         fontWeight: FontWeight.w400,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //     IntrinsicHeight(
              //       child: Row(
              //         children: [
              //           Gaps.h16,
              //           VerticalDivider(
              //             color: Colors.grey.shade300,
              //             thickness: 3,
              //             width: 10,
              //           ),
              //           Gaps.h44,
              //           const Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Gaps.v10,
              //               Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   FaIcon(FontAwesomeIcons.heart),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.message),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.arrowRotateRight),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.paperPlane),
              //                   Gaps.h10,
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Gaps.v20,
              //     const Row(
              //       children: [
              //         SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Stack(
              //             children: [
              //               Positioned(
              //                 top: 10,
              //                 left: 0,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/cat.jpeg',
              //                   ),
              //                   radius: 9,
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 5,
              //                 left: 20,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/jinger.jpeg',
              //                   ),
              //                   radius: 10,
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 30,
              //                 left: 10,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/mintchoco.png',
              //                   ),
              //                   radius: 8,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Text('12 replies • 999 likes'),
              //       ],
              //     ),
              //     SizedBox(
              //       width: 500,
              //       child: Divider(
              //         color: Colors.grey.shade400,
              //         thickness: 0.5,
              //       ),
              //     ),
              //     Gaps.v20,
              //     Row(
              //       children: [
              //         const SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Stack(
              //             children: [
              //               CircleAvatar(
              //                 backgroundImage: AssetImage(
              //                   "lib/images/Flag_of_France.png",
              //                 ),
              //                 radius: 25,
              //               ),
              //               Positioned(
              //                 top: 40,
              //                 left: 40,
              //                 child: FaIcon(
              //                   FontAwesomeIcons.circlePlus,
              //                   size: 10,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Gaps.h20,
              //         SizedBox(
              //           width: 300,
              //           child: Column(
              //             children: [
              //               Row(
              //                 children: [
              //                   const Text(
              //                     'France_Official',
              //                     style: TextStyle(
              //                       fontSize: Sizes.size16,
              //                       fontWeight: FontWeight.w700,
              //                     ),
              //                   ),
              //                   Gaps.h5,
              //                   Center(
              //                     child: SvgPicture.asset(
              //                       'lib/images/google-verified-seeklogo.com.svg',
              //                       width: 15,
              //                       height: 15,
              //                     ),
              //                   ),
              //                   Gaps.h32,
              //                   Gaps.h48,
              //                   const Text(
              //                     '24h',
              //                     style: TextStyle(
              //                       color: Colors.grey,
              //                       fontSize: Sizes.size16 + Sizes.size2,
              //                     ),
              //                   ),
              //                   Gaps.h20,
              //                   const FaIcon(
              //                     FontAwesomeIcons.ellipsis,
              //                   )
              //                 ],
              //               ),
              //               const Row(
              //                 children: [
              //                   SizedBox(
              //                     width: 300,
              //                     height: 50,
              //                     child: Text(
              //                       'Hello France !!',
              //                       style: TextStyle(
              //                         color: Colors.black,
              //                         fontSize: Sizes.size16,
              //                         fontWeight: FontWeight.w400,
              //                       ),
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //             ],
              //           ),
              //         )
              //       ],
              //     ),
              //     IntrinsicHeight(
              //       child: Row(
              //         children: [
              //           Gaps.h16,
              //           VerticalDivider(
              //             color: Colors.grey.shade300,
              //             thickness: 3,
              //             width: 10,
              //           ),
              //           Gaps.h32,
              //           Column(
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Row(
              //                 children: [
              //                   SizedBox(
              //                     width: 300,
              //                     height: 250,
              //                     child: ListView(
              //                       scrollDirection: Axis.horizontal,
              //                       children: <Widget>[
              //                         Container(
              //                           padding: const EdgeInsets.symmetric(
              //                             horizontal: Sizes.size40,
              //                           ),
              //                           width: 200,
              //                           height: 200,
              //                           decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(
              //                               40,
              //                             ),
              //                             image: const DecorationImage(
              //                               image: AssetImage(
              //                                   'lib/images/IMG_1608.jpeg'),
              //                             ),
              //                           ),
              //                         ),
              //                         Gaps.h10,
              //                         Container(
              //                           padding: const EdgeInsets.symmetric(
              //                             horizontal: Sizes.size40,
              //                           ),
              //                           width: 200,
              //                           height: 200,
              //                           decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(
              //                               40,
              //                             ),
              //                             image: const DecorationImage(
              //                               image: AssetImage(
              //                                   'lib/images/IMG_1607.jpeg'),
              //                             ),
              //                           ),
              //                         ),
              //                         Gaps.h10,
              //                         Container(
              //                           padding: const EdgeInsets.symmetric(
              //                             horizontal: Sizes.size40,
              //                           ),
              //                           width: 200,
              //                           height: 200,
              //                           decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(
              //                               40,
              //                             ),
              //                             image: const DecorationImage(
              //                               image: AssetImage(
              //                                   'lib/images/IMG_1606.jpeg'),
              //                             ),
              //                           ),
              //                         ),
              //                         Gaps.h10,
              //                         Container(
              //                           padding: const EdgeInsets.symmetric(
              //                             horizontal: Sizes.size40,
              //                           ),
              //                           width: 200,
              //                           height: 200,
              //                           decoration: BoxDecoration(
              //                             borderRadius:
              //                                 BorderRadius.circular(
              //                               40,
              //                             ),
              //                             image: const DecorationImage(
              //                               image: AssetImage(
              //                                   'lib/images/IMG_1605.jpeg'),
              //                             ),
              //                           ),
              //                         ),
              //                       ],
              //                     ),
              //                   ),
              //                 ],
              //               ),
              //               Gaps.v20,
              //               const Row(
              //                 mainAxisAlignment: MainAxisAlignment.start,
              //                 children: [
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.heart),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.message),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.arrowRotateRight),
              //                   Gaps.h10,
              //                   FaIcon(FontAwesomeIcons.paperPlane),
              //                   Gaps.h10,
              //                 ],
              //               ),
              //             ],
              //           ),
              //         ],
              //       ),
              //     ),
              //     Gaps.v20,
              //     const Row(
              //       children: [
              //         SizedBox(
              //           width: 50,
              //           height: 50,
              //           child: Stack(
              //             children: [
              //               Positioned(
              //                 top: 10,
              //                 left: 0,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/cat.jpeg',
              //                   ),
              //                   radius: 9,
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 5,
              //                 left: 20,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/jinger.jpeg',
              //                   ),
              //                   radius: 10,
              //                 ),
              //               ),
              //               Positioned(
              //                 top: 30,
              //                 left: 10,
              //                 child: CircleAvatar(
              //                   backgroundImage: AssetImage(
              //                     'lib/images/mintchoco.png',
              //                   ),
              //                   radius: 8,
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         Text('22 replies • 5012 likes'),
              //       ],
              //     ),
              //     SizedBox(
              //       width: 500,
              //       child: Divider(
              //         color: Colors.grey.shade400,
              //         thickness: 0.5,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
