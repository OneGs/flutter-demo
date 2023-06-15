import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();

  RxInt currentIndex = 0.obs;

  setCurrentIndex(int index) {
    currentIndex.value = index;
    print('index ${currentIndex.value}');
  }

  // controller
  PageController pageController = PageController();

  jumpToPage(int index) {
    pageController.jumpToPage(index);
  }
}
