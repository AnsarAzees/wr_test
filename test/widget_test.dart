import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wr_test/app/app_bindings/initial_binding.dart';
import 'package:wr_test/app/resources/app_string.dart';
import 'package:wr_test/app/routes/app_pages.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('MyWidget has a title discount for you',
      (WidgetTester tester) async {
    // Get.put<SizeConfig>(SizeConfig(), permanent: true);
    var app = GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      smartManagement: SmartManagement.full,
      initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
    );
    await tester.pumpWidget(app);
    // waiting for api call
    await tester.pump(Duration(seconds: 3));
    final titleFinder = find.text(AppStrings.discountForYou);
    final messageFinder = find.text(AppStrings.viewAll);
    expect(titleFinder, findsOneWidget);
    expect(messageFinder, findsOneWidget);
  });
}
