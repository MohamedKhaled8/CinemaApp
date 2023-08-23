import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cinmaapp/view/home_screen.dart';
import 'package:cinmaapp/view/home_screen.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

abstract class MainController extends GetxController {
  Widget body();

  void currentPages(int index);
}

class MainControllerImp extends MainController {
  int currentPage = 0;

  List<IconData> bottomIcons = [
    Icons.home_filled,
    CupertinoIcons.compass_fill,
    CupertinoIcons.ticket_fill,
    Icons.person_rounded
  ];

  @override
  Widget body() {
    switch (currentPage) {
      case 0:
          return  HomeScreen();
      case 1:
        return Center(
          child: Text(
            'Explore Page',
            style: font.copyWith(fontSize: 32.sp, color: white),
          ),
        );
      case 2:
        return Center(
          child: Text(
            'Tickets Page',
            style: font.copyWith(fontSize: 32.sp, color: white),
          ),
        );
      case 3:
        return Center(
          child: Text(
            'Profile Page',
            style: font.copyWith(fontSize: 32.sp, color: white),
          ),
        );
      default:
        return Center(
            child: Text(
          'Something Wrong !!',
          style: font.copyWith(fontSize: 32.sp, color: white),
        ));
    }
  }

  @override
  void currentPages(int index) {
    currentPage = index;
    update();
  }
}
