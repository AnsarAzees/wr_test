import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:wr_test/app/app_bindings/initial_binding.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(500, 1428),
      builder: () => GetMaterialApp(
        title: "Application",
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        smartManagement: SmartManagement.full,
        initialBinding: InitialBinding(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
      ),
    ),
  );
}
