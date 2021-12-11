import 'package:wr_test/app/models/banner.dart';
import 'package:wr_test/app/models/product.dart';

import 'carousel.dart';

class HomeFeedResponse {
  int? code;
  String? status;
  String? message;
  List<CarouselData>? carouselData;
  List<Product>? products;
  BannerData? banner;

  HomeFeedResponse({this.code, this.status, this.message, this.products});

  static HomeFeedResponse parse(dynamic json) {
    return HomeFeedResponse.fromJson(json);
  }

  HomeFeedResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    message = json['message'];
    if (json['carouselData'] != null) {
      carouselData = <CarouselData>[];
      json['carouselData'].forEach((v) {
        carouselData?.add(CarouselData.fromJson(v));
      });
    }
    if (json['products'] != null) {
      products = <Product>[];
      json['products'].forEach((v) {
        products?.add(Product.fromJson(v));
      });
    }
    banner =
        json['banner'] != null ? BannerData.fromJson(json['banner']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['message'] = message;
    if (carouselData != null) {
      data['carouselData'] = carouselData?.map((v) => v.toJson()).toList();
    }
    if (products != null) {
      data['products'] = products?.map((v) => v.toJson()).toList();
    }
    if (banner != null) {
      data['banner'] = banner?.toJson();
    }

    return data;
  }
}
