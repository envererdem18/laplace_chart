import 'package:flutter/material.dart';
import 'package:laplace_chart/core/constants/size_constants.dart';
import 'package:laplace_chart/core/constants/translation_constants.dart';
import 'package:laplace_chart/core/extensions/size_extensions.dart';
import 'package:laplace_chart/core/extensions/string_extemsions.dart';

class Position extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: Sizes.dimen_32.w, top: Sizes.dimen_8.h),
      child: Container(
        alignment: Alignment.topLeft,
        child: Text(
          "${TranslationConstants.myPosition.t(context)}",
          style: TextStyle(fontSize: Sizes.dimen_20.sp, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
