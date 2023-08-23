import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cinmaapp/data/model/movie_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:cinmaapp/data/data%20sources/movie_source.dart';

abstract class HomeController extends GetxController {
  onPageChanged(int value);
  // scalAndAngle(int index);
}

class HomeControllerImp extends HomeController
    with GetSingleTickerProviderStateMixin {
  PageController? controller;
  double viewPortFraction = 0.6;
  double? pageOffset = 1;
  int currentMovie = 1;

  @override
  void onInit() {
    super.onInit();
    controller =
        PageController(initialPage: 1, viewportFraction: viewPortFraction)
          ..addListener(() {
            pageOffset = controller!.page;
            update();
          });
  }

  @override
  void onClose() {
    super.onClose();
    controller?.dispose();
  }

  void onPageChanged(int value) {
    currentMovie = value % movies.length;
    update();
  }
}
