import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_task_assignments/core/common_ui/custom_text.dart';

class MyAppBar extends StatelessWidget {
  final double barHeight = 50.sp;

  MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: 'My Closet',
      size: 28.sp,
      isBold: true,
    );
  }
}
