import 'package:flutter/material.dart';
import 'package:wr_test/app/custom_widgets/network_image.dart';
import 'package:wr_test/app/models/product.dart';
import 'package:wr_test/app/resources/text_styles.dart';
import 'package:wr_test/app/utility/size_config.dart';

class ProductWidget extends StatelessWidget {
  final Product product;
  final int index;

  ProductWidget({required this.product, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                  color: Colors.black12,
                ),
                left: BorderSide(
                  color: index.isOdd ? Colors.black12 : Colors.transparent,
                ))),
        child: Column(
          children: [
            SizedBox(height: SizeConfig.safeBlockVertical * 2),
            WRNetworkImage(
              url: product.imageURL,
              height: 100,
              width: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: SizeConfig.safeBlockVertical),
            Text(product.name ?? "", style: Style.black10.textStyle),
            SizedBox(height: SizeConfig.safeBlockVertical * 0.5),
            Text("Min ${product.off}% off", style: Style.green10.textStyle),
            SizedBox(height: SizeConfig.safeBlockVertical),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
