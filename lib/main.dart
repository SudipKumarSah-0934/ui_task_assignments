import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_task_assignments/core/sevices/shared_prefs.dart';
import 'package:ui_task_assignments/core/utils/themes/bloc/theme_bloc.dart';
import 'package:ui_task_assignments/features/chat/presentation/chat_screen.dart';
import 'package:ui_task_assignments/features/discover/presentation/discover_screen.dart';
import 'package:ui_task_assignments/features/groups/presentation/groups_screen.dart';
import 'package:ui_task_assignments/features/my_closet/presentation/my_closet_screen.dart';
import 'package:ui_task_assignments/features/saved/presentation/saved_screen.dart';
import 'package:ui_task_assignments/servce_locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpLocator();
  await PreferenceHelper.init();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => locator<ThemeBloc>(),
              ),
            ],
            child:
                BlocBuilder<ThemeBloc, ThemeState>(builder: (context, state) {
              return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: state.themeData,
                  home: HomeScreen());
            }),
          );
        });
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _tabs = [
    const MyClosetScreen(),
    const GroupsScreen(),
    const DiscoverScreen(),
    const SavedScreen(),
    const ChatScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(xFontAwesomeIcons.circleUser),
            label: 'My Closet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups),
            label: 'Groups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(xFontAwesomeIcons.comment),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
