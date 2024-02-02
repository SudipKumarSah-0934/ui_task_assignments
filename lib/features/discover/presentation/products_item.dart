import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  final String name = 'Product Name';
  final double price = 19.99;
  final String image =
      'assets/images/product.png'; // Replace with your image path
  final bool isFavorite = false; // Static favorite state

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {}, // Replace with your desired action on tap
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200.h,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEDF1FA),
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                ),
                Positioned(
                  right: 20.w, // Right position for all products
                  bottom: -80.h,
                  child: Image.asset(image, height: 100.h),
                ),
                Positioned(
                  left: 15.w,
                  bottom: 20.h,
                  child: GestureDetector(
                    onTap: () {}, // Replace with favorite toggle logic
                    child: CircleAvatar(
                      radius: 18.r,
                      backgroundColor: Colors.white,
                      child: isFavorite
                          ? Icon(Icons.favorite,
                              color: Theme.of(context).primaryColor)
                          : Icon(Icons.favorite_outline,
                              color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ],
            ),
            Text(name, style: Theme.of(context).textTheme.bodyLarge)
              ..animate().fade().slideY(
                    duration: const Duration(milliseconds: 200),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
            Text('\$${price}', style: Theme.of(context).textTheme.bodyLarge)
              ..animate().fade().slideY(
                    duration: const Duration(milliseconds: 200),
                    begin: 1,
                    curve: Curves.easeInSine,
                  ),
          ],
        ),
      ),
    );
  }
}
