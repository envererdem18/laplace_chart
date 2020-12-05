import 'package:flutter/material.dart';
import 'package:laplace_chart/core/color_palette/color_palette.dart';
import 'package:laplace_chart/core/constants/size_constants.dart';
import 'package:laplace_chart/core/utils/screen_utils/screen_util.dart';

class TextStyles {
  static final TextStyle logoText = TextStyle(fontSize: ScreenUtil().setSp(14), color: Colors.white, fontWeight: FontWeight.bold);
  static final TextStyle finfreeText =
      TextStyle(fontSize: ScreenUtil().setSp(Sizes.dimen_32), color: ColorPalette.verdun_green, fontWeight: FontWeight.bold);
}
