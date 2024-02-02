import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_task_assignments/core/common_ui/custom_main_button.dart';
import 'package:ui_task_assignments/core/utils/app_colors.dart';
import 'package:ui_task_assignments/core/utils/app_strings.dart';
import 'package:ui_task_assignments/core/utils/media_query.dart';

class FilterProduct extends StatelessWidget {
  const FilterProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.sp),
      child: GestureDetector(
        onTap: () {
          filterBottomSheet(context);
        },
        child: Container(
            width: kWidth(context) / 3,
            decoration: BoxDecoration(
              color: ColorManager.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                  blurRadius: 5,
                  color: ColorManager.grey,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Filters",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                Icon(Icons.tune),
              ],
            )),
      ),
    );
  }

  Future<dynamic> filterBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        context: context,
        builder: (BuildContext _) {
          return SizedBox(
            height: kHeight(context) / 2.3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StatefulBuilder(builder: (_, setState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(AppStrings.filter,
                            style: Theme.of(context).textTheme.headline6),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          AppStrings.price,
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: ColorManager.grey,
                                  ),
                        ),
                        SizedBox(
                          width: kWidth(context) / 2,
                          child: MainButton(
                              text: AppStrings.apply,
                              ontab: () {
                                Navigator.pop(context);
                              },
                              height: kHeight(context) / 15),
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ),
          );
        });
  }
}
