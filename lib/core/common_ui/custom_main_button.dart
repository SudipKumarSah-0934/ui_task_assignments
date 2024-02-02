import 'package:flutter/material.dart';
import 'package:ui_task_assignments/core/utils/app_colors.dart';
import 'package:ui_task_assignments/core/utils/media_query.dart';


class MainButton extends StatelessWidget {
  final String text;
  final VoidCallback ontab;
  final double height;
  const MainButton(
      {Key? key, required this.text, required this.ontab, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(context),
      height: height,
      child: ElevatedButton(
        onPressed: ontab,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: ColorManager.white,fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
