import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WRNetworkImage extends StatelessWidget {
  const WRNetworkImage(
      {Key? key, this.url, this.width, this.height, this.fit = BoxFit.cover})
      : super(key: key);
  final String? url;
  final double? width;
  final double? height;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return url != null
        ? CachedNetworkImage(
            fadeInCurve: Curves.easeIn,
            fadeOutCurve: Curves.easeOut,
            fadeInDuration: Duration(milliseconds: 100),
            fadeOutDuration: Duration(milliseconds: 100),
            imageUrl: url!,
            width: width,
            height: height,
            fit: fit,
            placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                    strokeWidth: 0.2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.blue))),
            errorWidget: (context, url, error) => Image.asset(
                'assets/images/no_image.jpg',
                fit: BoxFit.cover,
                width: width,
                height: height),
          )
        : Icon(Icons.image, size: height ?? 60.0, color: Colors.blue);
  }
}
