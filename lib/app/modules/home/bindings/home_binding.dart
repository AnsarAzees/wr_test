import 'package:get/get.dart';
import 'package:wr_test/app/services/network/http_client.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<HttpClient>()),
    );
  }
}
