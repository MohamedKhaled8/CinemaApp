import 'package:flutter/material.dart';
import '../../core/constant/size.dart';
import '../../core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: s.setHeight(40),
      width: s.setWidth(370),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30).w,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5).w,
          decoration: BoxDecoration(
              color: white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(30)),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Search',
                prefixIcon: Icon(
                  Icons.search,
                  color: white.withOpacity(0.7),
                ),
                hintStyle: font.copyWith(color: white.withOpacity(0.7))),
          ),
        ),
      ),
    );
  }
}
