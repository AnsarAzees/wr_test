import 'package:flutter/material.dart';
import 'package:wr_test/app/resources/colors.dart';

enum Style { white12, textFieldLabel, black10, green10, black14 }

extension TextStyles on Style {
  TextStyle get textStyle => TextStyle(color: textColor, fontSize: size);
}

extension TextSize on Style {
  double get size {
    switch (this) {
      case Style.white12:
        return 12;
      case Style.textFieldLabel:
      case Style.black14:
        return 14;
      case Style.black10:
      case Style.green10:
        return 10;
    }
  }
}

extension TextColors on Style {
  Color get textColor {
    switch (this) {
      case Style.white12:
        return Colors.white;
      case Style.textFieldLabel:
        return AppColors.lightGrey;
      case Style.black10:
      case Style.black14:
        return AppColors.black;
      case Style.green10:
        return AppColors.green;
    }
  }
}
