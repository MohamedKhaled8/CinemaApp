import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCategoryHome extends StatelessWidget {
  final String emoticon, name;
  const CustomCategoryHome({
    Key? key,
    required this.emoticon,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: s.setHeight(60),
          width: s.setWidth(60),
          decoration: BoxDecoration(
              color: white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(15)),
          child: Image.asset('assets/emoticons/$emoticon'),
        ),
         SizedBox(height: s.setHeight(15)),
        Text(
          name,
          style: font.copyWith(fontSize: 14.sp, color: white),
        )
      ],
    );
  }
}
