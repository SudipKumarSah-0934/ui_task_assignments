import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_task_assignments/features/my_closet/presentation/widgets/custom_collapsed_app_bar.dart';
import 'package:ui_task_assignments/features/my_closet/presentation/widgets/custom_dress_card.dart';
import 'package:ui_task_assignments/features/my_closet/presentation/widgets/custom_extended_app_bar.dart';

class MyClosetScreen extends StatefulWidget {
  const MyClosetScreen({super.key});

  @override
  State<MyClosetScreen> createState() => _MyClosetScreenState();
}

class _MyClosetScreenState extends State<MyClosetScreen> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      shrinkWrap: true,
      slivers: <Widget>[
        SliverAppBar(
          stretch: true,
          title: MyAppBar(),
          centerTitle: true,
          pinned: true,
          expandedHeight: 160.sp,
          toolbarHeight: 40.sp,
          flexibleSpace: DecoratedBox(
            decoration: const BoxDecoration(color: Colors.deepOrangeAccent),
            child: FlexibleSpaceBar(
              background: MyFlexiableAppBar(),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisSpacing: 0, crossAxisSpacing: 0),
          delegate: SliverChildListDelegate(
            List.generate(
              10,
              (index) => const DressCard(
                imageUrl: 'https://via.placeholder.com/200x300/33d6ff/fff',
                dressName: 'Jeans', // Replace with actual dress names
              ),
            ),
          ),
        ),
      ],
    );
  }
}
