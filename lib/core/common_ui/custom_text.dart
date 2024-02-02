import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// as we need different font size of text,
//making a custom text widget to accept
//required properties from arguments
class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final bool isBold;
  final bool alignCenter;
  final Color? textColor;
  final String? fontFamily;

  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.isBold = false,
    this.alignCenter = false,
    this.textColor,
    this.fontFamily,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.sp),
      child: Text(
        text,
        textAlign: alignCenter ? TextAlign.center : null,
        maxLines: 3,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            fontSize: size,
            fontFamily: fontFamily ?? 'Almarai',
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: textColor ?? Colors.white),
      ),
    );
  }
}
