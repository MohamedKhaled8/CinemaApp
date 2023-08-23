import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:cinmaapp/widgets/navigation_bar/custom_bottom_bar.dart';
import 'package:cinmaapp/controller/main_controller/main_controller.dart';

class MainPageScreen extends StatelessWidget {
  MainPageScreen({super.key});
  final MainControllerImp mainControllerImp = Get.put(MainControllerImp());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainControllerImp>(builder: (_) {
      return Scaffold(
          backgroundColor: black,
          body: mainControllerImp.body(),
          bottomNavigationBar:
              SizedBox(height: s.setHeight(50), child: CustomBottomNavBar()));
    });
  }
}
