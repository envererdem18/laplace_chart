import 'package:flutter/material.dart';
import 'package:laplace_chart/core/color_palette/color_palette.dart';
import 'package:laplace_chart/core/constants/size_constants.dart';
import 'package:laplace_chart/core/extensions/size_extensions.dart';
import 'package:laplace_chart/presentation/core/constants/route_constants.dart';
import 'package:laplace_chart/presentation/core/routes/route_service.dart';

import 'widgets/chart.dart';
import 'widgets/header.dart';
import 'widgets/position.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorPalette.white,
        elevation: 0,
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: ColorPalette.lima,
              size: Sizes.dimen_32,
            ),
            onPressed: null),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: ColorPalette.limeade,
                size: Sizes.dimen_24.sp,
              ),
              onPressed: () {
                RouteService.instance.navigateToPage(path: RouteConstants.SETTINGS_SCREEN);
              })
        ],
      ),
      body: Column(
        children: [Header(), Expanded(child: Chart()), Expanded(child: Position())],
      ),
    );
  }
}
