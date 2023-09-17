import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_thread_clone/widgets/activity_screen.dart';
import 'package:flutter_thread_clone/widgets/main_navigator_screen.dart';
import 'package:flutter_thread_clone/widgets/privacy_screen.dart';
import 'package:flutter_thread_clone/widgets/profile_screen.dart';
import 'package:flutter_thread_clone/widgets/search_screen.dart';
import 'package:flutter_thread_clone/widgets/setting_screen.dart';
import 'package:go_router/go_router.dart';

final routeProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      routes: [
        GoRoute(
          path: "/:tab(home|search|activity|profile)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) {
            final tab = state.pathParameters["tab"]!;
            return MainNavigationScreen(tab: tab);
          },
        ),
        GoRoute(
          name: SearchScreen.routeName,
          path: SearchScreen.routeURL,
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          name: ActivityScreen.routeName,
          path: ActivityScreen.routeURL,
          builder: (context, state) => const ActivityScreen(),
        ),
        GoRoute(
          name: ProfileScreen.routeName,
          path: ProfileScreen.routeURL,
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          name: SettingScreen.routeName,
          path: SettingScreen.routeURL,
          builder: (context, state) => const SettingScreen(),
          routes: [
            GoRoute(
              name: PrivacyScreen.routeName,
              path: PrivacyScreen.routeURL,
              builder: (context, state) => const PrivacyScreen(),
            ),
          ],
        ),
      ],
    );
  },
);
