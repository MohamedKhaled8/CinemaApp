import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItem extends StatelessWidget {
  final IconData icon;
  final String category, categoryValue;
  const CategoryItem({
    Key? key,
    required this.icon,
    required this.category,
    required this.categoryValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: s.setHeight(80),
      width: s.setWidth(90),
      padding: const EdgeInsets.symmetric(vertical: 12).w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              width: 1,
              color: white,
              strokeAlign: BorderSide.strokeAlignOutside)),
      child: Column(
        children: [
          Container(
              width: s.setWidth(30),
              height: s.setHeight(30),
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(color: white.withOpacity(0.2), blurRadius: 5)
              ]),
              child: Icon(icon, color: white)),
       
          Text(category,
              style: font.copyWith(
                  color: white.withOpacity(0.6), fontSize: 12.sp)),
       
          Text(categoryValue,
              style: font.copyWith(
                  color: white, fontSize: 14.sp, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
