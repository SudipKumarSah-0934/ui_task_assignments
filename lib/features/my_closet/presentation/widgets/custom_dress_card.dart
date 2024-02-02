import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_task_assignments/core/common_ui/custom_text.dart';
import 'package:ui_task_assignments/core/common_ui/screen_padding.dart';

class DressCard extends StatelessWidget {
  final String imageUrl;
  final String dressName;

  const DressCard({
    required this.imageUrl,
    required this.dressName,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenPadding(
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(18.sp),
        ),
        child: Stack(fit: StackFit.expand, children: [
          Image.network(
            imageUrl,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 10.sp,
            left: 45.sp,
            child: CustomText(text: dressName),
          ),
        ]),
      ),
    );
  }
}
