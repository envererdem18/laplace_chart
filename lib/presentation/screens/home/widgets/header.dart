import 'package:flutter/material.dart';
import 'package:laplace_chart/core/color_palette/color_palette.dart';
import 'package:laplace_chart/core/constants/size_constants.dart';
import 'package:laplace_chart/core/extensions/size_extensions.dart';
import 'package:laplace_chart/core/utils/screen_utils/screen_util.dart';
import 'package:laplace_chart/presentation/core/styles/text_styles.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Sizes.dimen_16.w,
        left: Sizes.dimen_20.h,
        right: Sizes.dimen_20.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(text: "Finfree\n", style: TextStyles.finfreeText, children: [
              TextSpan(
                text: "8,02₺\n",
                style: TextStyles.finfreeText.copyWith(color: ColorPalette.lima, fontWeight: FontWeight.normal),
              ),
              TextSpan(
                text: "%1.91 Artış\n",
                style: TextStyles.finfreeText.copyWith(color: ColorPalette.lima, fontSize: ScreenUtil().setSp(Sizes.dimen_12)),
              ),
              TextSpan(
                text: "%54 Yıllık Değişim\n",
                style: TextStyles.finfreeText.copyWith(color: ColorPalette.verdun_green, fontSize: ScreenUtil().setSp(Sizes.dimen_12)),
              )
            ]),
          ),
          Stack(
            fit: StackFit.loose,
            children: [
              Container(
                decoration: BoxDecoration(color: ColorPalette.lima, borderRadius: BorderRadius.circular(Sizes.dimen_10.sp)),
                child: Padding(padding: EdgeInsets.all(Sizes.dimen_10), child: Text("AL", style: TextStyle(color: Colors.white))),
              ),
              Container(
                margin: EdgeInsets.only(left: Sizes.dimen_32.w),
                decoration: BoxDecoration(color: ColorPalette.verdun_green, borderRadius: BorderRadius.circular(Sizes.dimen_10.sp)),
                child: Padding(padding: EdgeInsets.all(Sizes.dimen_10), child: Text("SAT", style: TextStyle(color: Colors.white))),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
