import 'package:flutter/cupertino.dart';
import 'package:ui_task_assignments/core/router/app_routes.dart';
import 'package:ui_task_assignments/features/chat/presentation/chat_screen.dart';
import 'package:ui_task_assignments/features/discover/presentation/discover_screen.dart';
import 'package:ui_task_assignments/features/groups/presentation/groups_screen.dart';
import 'package:ui_task_assignments/features/my_closet/presentation/my_closet_screen.dart';
import 'package:ui_task_assignments/features/saved/presentation/saved_screen.dart';
import 'package:ui_task_assignments/main.dart';



Route<dynamic> onGenerateRoute(RouteSettings settings) {
 // Object? argument = settings.arguments;
  switch (settings.name) {
    case AppRoutes.homeScreen:
      return CupertinoPageRoute(
          builder: (context) => const HomeScreen());
    case AppRoutes.myClosetScreen:
      return CupertinoPageRoute(
        builder: (context) => const MyClosetScreen(),
      );
    case AppRoutes.groupsScreen:
      return CupertinoPageRoute(
        builder: (context) => const GroupsScreen(),
      );
    case AppRoutes.discoverScreen:
      return CupertinoPageRoute(
        builder: (context) => const DiscoverScreen(),
      );
    case AppRoutes.savedScreen:
      return CupertinoPageRoute(
        builder: (context) => const SavedScreen(),
      );
    case AppRoutes.chatScreen:
      return CupertinoPageRoute(
        builder: (context) => const ChatScreen(),
      );
    default:
      return CupertinoPageRoute(builder: (context) => const MyClosetScreen());
  }
}

Route createRoute(Widget page, Offset begin, Offset end) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
