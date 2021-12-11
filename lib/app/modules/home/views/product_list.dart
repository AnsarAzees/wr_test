import 'package:flutter/material.dart';
import 'package:wr_test/app/custom_widgets/product_widget.dart';
import 'package:wr_test/app/models/product.dart';
import 'package:wr_test/app/utility/size_config.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({Key? key, required this.products}) : super(key: key);
  final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
          padding: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 3,
              vertical: SizeConfig.safeBlockVertical * 2),
          child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            padding: EdgeInsets.zero,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return ProductWidget(product: products[index], index: index);
            },
          ),
        ),
      ],
    );
  }
}
