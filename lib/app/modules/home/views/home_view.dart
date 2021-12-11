import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wr_test/app/custom_widgets/carousal_widget.dart';
import 'package:wr_test/app/custom_widgets/loading_indicator.dart';
import 'package:wr_test/app/models/app_state.dart';
import 'package:wr_test/app/modules/home/views/banner_widget.dart';
import 'package:wr_test/app/modules/home/views/product_list.dart';
import 'package:wr_test/app/resources/app_string.dart';
import 'package:wr_test/app/resources/colors.dart';
import 'package:wr_test/app/resources/text_styles.dart';
import 'package:wr_test/app/utility/size_config.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.put<SizeConfig>(SizeConfig(), permanent: true);
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      extendBodyBehindAppBar: true,
      body: RefreshIndicator(
        onRefresh: () {
          return controller.loadHomePageData();
        },
        child: Obx(() {
          return SafeArea(
            top: false,
            child: controller.appState.value == AppState.loading
                ? LoadingIndicator()
                : CustomScrollView(
                    slivers: <Widget>[
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: SizeConfig.safeBlockVertical * 25,
                        flexibleSpace: WRCarousal(
                          carouselImages: controller.carousals,
                        ),
                        backgroundColor: Colors.transparent,
                        stretch: true,
                      ),
                      SliverAppBar(
                        toolbarHeight: 45,
                        pinned: true,
                        backgroundColor: AppColors.lightBlue,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppStrings.discountForYou,
                                style: Style.black14.textStyle),
                            TextButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.all<Color>(
                                          AppColors.blue)),
                              child: Text(AppStrings.viewAll,
                                  style: Style.white12.textStyle),
                            )
                          ],
                        ),
                        automaticallyImplyLeading: false,
                        centerTitle: false,
                      ),
                      SliverList(
                          delegate: SliverChildListDelegate([
                        Container(
                          color: Colors.lightBlueAccent,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: SizeConfig.safeBlockHorizontal * 3,
                                vertical: SizeConfig.safeBlockVertical * 2),
                            child: ProductGridView(
                              products: controller.products,
                            ),
                          ),
                        ),
                        if (controller.banner.value.imageURL != null)
                          Obx(() {
                            return SingleBannerWidget(
                                bannerUrl: controller.banner.value.imageURL!);
                          })
                      ])),
                    ],
                  ),
          );
        }),
      ),
    );
  }
}
