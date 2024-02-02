import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_task_assignments/core/utils/media_query.dart';
import 'package:ui_task_assignments/features/discover/presentation/filter_products.dart';
import 'package:ui_task_assignments/features/discover/presentation/products_item.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Discover",
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          automaticallyImplyLeading: true),
      body: Column(
        children: [
          Align(alignment: Alignment.centerRight, child: FilterProduct()),
          10.verticalSpace,
          Container(
            height: kHeight(context) / 1.42,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15.w,
                mainAxisSpacing: 15.h,
                mainAxisExtent: 260.h,
              ),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 8,
              physics: ScrollPhysics(),
              itemBuilder: (context, index) => ProductItem(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 100, // To change the height of DrawerHeader
                width: double.infinity, // To Change the width of DrawerHeader
                child: DrawerHeader(
                  child: Text(
                    '',
                  ),
                ),
              ),
              ListTile(
                title: const Text('Suggested'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Followers'),
                onTap: () {},
              ),
              ListTile(
                title: const Text('Followings'),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
