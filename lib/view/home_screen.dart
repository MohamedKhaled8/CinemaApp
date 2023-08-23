import 'dart:math';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:cinmaapp/core/constant/size.dart';
import 'package:cinmaapp/view/deatil_screen.dart';
import 'package:cinmaapp/data/model/movie_model.dart';
import '../widgets/homescreen/custom_form_field.dart';
import 'package:cinmaapp/core/constant/color_font.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinmaapp/data/data%20sources/movie_source.dart';
import 'package:cinmaapp/widgets/homescreen/custom_app_bar.dart';
import 'package:cinmaapp/widgets/homescreen/custom_cat_home.dart';
import 'package:cinmaapp/data/data%20sources/category_cource.dart';
import 'package:cinmaapp/controller/home_controller/home_controller.dart';


class HomeScreen extends StatelessWidget {
  final HomeControllerImp controller = Get.put(HomeControllerImp());

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        title: const CustomAppBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           SizedBox(height: s.setHeight(30)),
           const Form(
            child: CustomTextFormField(),
          ),
           SizedBox(height: s.setHeight(20)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Category',
                  style: font.copyWith(
                      color: white, fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'See All',
                      style: font.copyWith(fontSize: 14.sp, color: orange),
                    ),
                     Icon(
                      Icons.chevron_right_rounded,
                      color: orange,
                      size: 20.h,
                    )
                  ],
                )
              ],
            ),
          ),
           SizedBox(height: s.setHeight(30)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...List.generate(
                    categories.length,
                    (index) => CustomCategoryHome(
                          emoticon: categories[index].emoticon,
                          name: categories[index].name,
                        ))
              ],
            ),
          ),
           SizedBox(height: s.setHeight(40)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30).w,
            child: Text(
              'Showing this month',
              style: font.copyWith(
                  color: white, fontSize: 16.sp, fontWeight: FontWeight.bold),
            ),
          ),
           SizedBox(height: s.setHeight(30)),
          GetBuilder<HomeControllerImp>(builder: (_) {
            return Expanded(
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  PageView.builder(
                    controller: controller.controller,
                    onPageChanged: controller.onPageChanged,
                    itemBuilder: (context, index) {
                      double scale = max(
                          controller.viewPortFraction,
                          (1 -
                              (controller.pageOffset! - index).abs() +
                              controller.viewPortFraction));
                      double angle = 0.0;
                      if (controller.controller!.position.haveDimensions) {
                        angle = index.toDouble() -
                            (controller.controller!.page ?? 0);
                        angle = (angle * 5).clamp(-5, 5);
                      } else {
                        angle = index.toDouble() - 1;
                        angle = (angle * 5).clamp(-5, 5);
                      }
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailesScreen(
                              movie: movies[index % movies.length],
                              ));
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.only(top: 100 - (scale / 1.6 * 100)),
                          child: Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Transform.rotate(
                                angle: angle * pi / 180,
                                child: Hero(
                                  tag: movies[index % movies.length].title,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(24),
                                    child: CachedNetworkImage(
                                      key: UniqueKey(),
                                      height: s.setHeight(250),
                                      width: s.setWidth(200),
                                      imageUrl:
                                          movies[index % movies.length].poster,
                                      errorWidget: (context, url, error) {
                                        return const Icon(Icons.error);
                                      },
                                      progressIndicatorBuilder:
                                          (context, url, progress) {
                                        return Center(
                                            child: CircularProgressIndicator(
                                          value: progress.progress,
                                        ));
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: 330,
                    child: Row(
                      children: [
                        ...List.generate(
                            movies.length,
                            (index) => AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  margin: index == movies.length - 1
                                      ? const EdgeInsets.only()
                                      : const EdgeInsets.only(right: 15).r,
                                  width: controller.currentMovie == index
                                      ? 30
                                      : 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      color: controller.currentMovie == index
                                          ? orange
                                          : white,
                                      borderRadius: BorderRadius.circular(15)),
                                ))
                      ],
                    ),
                  )
                ],
              ),
            );
          })
        ],
      ),
    );
  }
}

