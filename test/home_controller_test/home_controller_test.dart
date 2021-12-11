import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:wr_test/app/modules/home/controllers/home_controller.dart';
import 'package:wr_test/app/services/network/http_client.dart';
import 'package:wr_test/app/services/network/network.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("initial state", () {
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put(HomeController(Get.find<HttpClient>()));

    test("home controller exist", () async {
      final controller = HomeController.to;
      expect(controller, isNotNull);
    });

    test("http client exist", () {
      final controller = HomeController.to;
      expect(controller.httpClient, isNotNull);
    });

    test("products empty", () {
      final controller = HomeController.to;
      expect(controller.products, isEmpty);
    });
    test("carousals empty", () {
      final controller = HomeController.to;
      expect(controller.products, isEmpty);
    });
    test("banner is empty", () {
      final controller = HomeController.to;
      expect(controller.banner.value.id, isNull);
    });
  });
  group("After calling api", () {
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
    Get.put(HomeController(Get.find<HttpClient>()));
    final controller = HomeController.to;

    test("get data", () async {
      await controller.loadHomePageData();
      expect(controller.products, isNotEmpty);
    });

    test("http client exist", () async {
      expect(controller.httpClient, isNotNull);
    });

    test("products not empty", () {
      expect(controller.products, isNotEmpty);
    });
    test("carousals not empty", () {
      expect(controller.products, isNotEmpty);
    });
    test("banner is not empty", () {
      expect(controller.banner.value.id, isNotNull);
    });
  });
}
