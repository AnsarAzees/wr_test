import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_test/app/models/app_state.dart';
import 'package:wr_test/app/models/banner.dart';
import 'package:wr_test/app/models/carousel.dart';
import 'package:wr_test/app/models/product.dart';
import 'package:wr_test/app/resources/mock_data.dart';
import 'package:wr_test/app/services/network/http_client.dart';

class HomeController extends GetxController with StateMixin {
  final HttpClient httpClient;
  HomeController(this.httpClient);
  final count = 0.obs;
  final appState = AppState.idle.obs;
  final carousals = <CarouselData>[].obs;
  final banner = BannerData().obs;
  final products = <Product>[].obs;
  static HomeController get to => Get.find();

  @override
  void onInit() {
    loadHomePageData();
    super.onInit();
  }

  Future<void> loadHomePageData() async {
    try {
      // var response = await httpClient.request(EndPoint.getHomeFeed);
      // mocking api call here
      appState.value = AppState.loading;
      await Future.delayed(Duration(seconds: 2)).whenComplete(() {
        products.shuffle();
        carousals.shuffle();
        bannerList.shuffle();
        products.value = productsList;
        carousals.value = carousalImages;
        banner.value = bannerList.first;
        appState.value = AppState.done;
      });
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          colorText: Colors.white,
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
