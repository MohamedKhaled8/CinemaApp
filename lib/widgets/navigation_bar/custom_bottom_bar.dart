import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:cinmaapp/controller/main_controller/main_controller.dart';

class CustomBottomNavBar extends StatelessWidget {
   CustomBottomNavBar({
    super.key,
   
  });

  final MainControllerImp mainControllerImp = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
            mainControllerImp.bottomIcons.length,
            (index) => InkWell(
                  onTap: () {
                    mainControllerImp.currentPages(index);
                  },
                  child: Stack(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 100),
                        height: mainControllerImp.currentPage == index
                            ? s.setHeight(25)
                            : 0,
                        width: mainControllerImp.currentPage == index
                            ? s.setWidth(25)
                            : 0,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: white.withOpacity(0.1),
                                  spreadRadius:
                                      mainControllerImp.currentPage ==
                                              index
                                          ? 10
                                          : 0,
                                  blurRadius:
                                      mainControllerImp.currentPage ==
                                              index
                                          ? 10
                                          : 0)
                            ]),
                      ),
                      Icon(
                        mainControllerImp.bottomIcons[index],
                        color: mainControllerImp.currentPage == index
                            ? white
                            : white.withOpacity(0.3),
                      ),
                    ],
                  ),
                )));
  }
}
