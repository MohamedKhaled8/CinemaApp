import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15 , vertical: 15).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Welcome Angelina',
                      style: font.copyWith(
                          fontSize: 14.sp, color: white.withOpacity(0.8))),
                   SizedBox(width: s.setWidth(5)),
                  Image.asset(
                    'assets/emoticons/hand.png',
                    width: s.setHeight(20),
                  )
                ],
              ),
               SizedBox(height: s.setHeight(12)),
              Text('Let\'s relax and watch movie !',
                  style: font.copyWith(
                      fontSize: 14.sp,
                      color: white.withOpacity(0.8),
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            width: s.setHeight(40),
            height: s.setWidth(40),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage('assets/profile.jpg'),
                    fit: BoxFit.fill)),
          )
        ],
      ),
    );
  }
}
