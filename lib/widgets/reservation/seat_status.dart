import 'package:flutter/material.dart';
import '../../core/constant/size.dart';
import '../../core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SeatStatus extends StatelessWidget {
  final Color color;
  final String status;
  const SeatStatus({
    Key? key,
    required this.color,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: s.setWidth(17),
          height: s.setHeight(17),
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
         SizedBox(width: s.setWidth(10)),
        Text(
          status,
          style: font.copyWith(fontSize: 14.sp, color: white),
        )
      ],
    );
  }
}
