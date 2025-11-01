import 'package:flutter/material.dart';
import 'package:movie_app_test/core/util/colors_manager.dart';
import 'package:movie_app_test/core/util/font_weight_helper.dart';

class TextStyles {
  static TextStyle font16SemiBold = TextStyle(
    // color: ColorsManager.white,
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
  );
  static TextStyle font14GrayRegular = TextStyle(
    color: ColorsManager.gray,
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
  );
  static TextStyle font25Medium = TextStyle(
    fontSize: 25,

    fontWeight: FontWeightHelper.medium,
  );
}
