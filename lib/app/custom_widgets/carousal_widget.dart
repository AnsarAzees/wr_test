import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';
import 'package:wr_test/app/custom_widgets/network_image.dart';
import 'package:wr_test/app/models/carousel.dart';

class WRCarousal extends StatelessWidget {
  const WRCarousal({Key? key, required this.carouselImages}) : super(key: key);
  final List<CarouselData> carouselImages;
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemCount: carouselImages.length,
      autoplay: true,
      loop: true,
      pagination: SwiperPagination(),
      itemBuilder: (BuildContext context, int index) {
        return Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.amber),
            child: WRNetworkImage(
                url: carouselImages[index].imageURL,
                height: double.infinity,
                width: double.infinity));
      },
    );
  }
}
