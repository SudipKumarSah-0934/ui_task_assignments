import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ui_task_assignments/core/common_ui/custom_text.dart';
import 'package:ui_task_assignments/core/common_ui/screen_padding.dart';
import 'package:ui_task_assignments/core/utils/app_colors.dart';

class MyFlexiableAppBar extends StatelessWidget {
  final double appBarHeight = 70.sp;

  MyFlexiableAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + appBarHeight,
      decoration: const BoxDecoration(
        color: Colors.deepOrangeAccent,
      ),
      child: ScreenPadding(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 40.sp,
                ),
                CustomText(text: "Name", isBold: true, size: 20.sp),
                const CustomText(text: "Username", isBold: true),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  xFontAwesomeIcons.circlePlus,
                  size: 30.sp,
                  color: ColorManager.white,
                ),
                CustomText(text: "Add New", size: 18.sp, isBold: true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
