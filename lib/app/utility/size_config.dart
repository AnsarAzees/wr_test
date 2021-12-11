import 'package:get/get.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  SizeConfig() {
    screenWidth = Get.width;
    screenHeight = Get.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        Get.mediaQuery.padding.left + Get.mediaQuery.padding.right;
    _safeAreaVertical =
        Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  void init() {
    screenWidth = Get.width;
    screenHeight = Get.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        Get.mediaQuery.padding.left + Get.mediaQuery.padding.right;
    _safeAreaVertical =
        Get.mediaQuery.padding.top + Get.mediaQuery.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
