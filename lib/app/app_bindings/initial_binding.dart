import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:wr_test/app/services/network/http_client.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<LocalStorage>(() => LocalStorageImpl());
    Get.put<HttpClient>(HttpClientImpl(Dio()), permanent: true);
  }
}
