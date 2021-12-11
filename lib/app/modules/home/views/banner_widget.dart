import 'package:flutter/material.dart';
import 'package:wr_test/app/custom_widgets/network_image.dart';
import 'package:wr_test/app/utility/size_config.dart';

class SingleBannerWidget extends StatelessWidget {
  const SingleBannerWidget({Key? key, required this.bannerUrl})
      : super(key: key);
  final String bannerUrl;
  @override
  Widget build(BuildContext context) {
    return WRNetworkImage(
        url: bannerUrl,
        height: SizeConfig.safeBlockVertical * 25,
        width: double.infinity);
  }
}
