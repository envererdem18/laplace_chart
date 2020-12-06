import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:laplace_chart/core/color_palette/color_palette.dart';
import 'package:laplace_chart/core/constants/size_constants.dart';
import 'package:laplace_chart/core/constants/translation_constants.dart';
import 'package:laplace_chart/core/extensions/size_extensions.dart';
import 'package:laplace_chart/core/extensions/string_extemsions.dart';
import 'package:laplace_chart/presentation/screens/home/providers/chart_provider.dart';
import 'package:provider/provider.dart';

class Chart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ChartProvider>(context);
    return Padding(
      padding: EdgeInsets.only(
        left: Sizes.dimen_4.h,
        right: Sizes.dimen_4.h,
      ),
      child: Container(
        width: double.infinity,
        child: Card(
          elevation: 3,
          child: Container(
            margin: EdgeInsets.all(Sizes.dimen_10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${TranslationConstants.now.t(context)}"),
                provider.demoModel == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : _buildChart(),
                _buildMenu(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChart() {
    return Consumer<ChartProvider>(builder: (context, provider, child) {
      var data = provider.data;
      return Expanded(
          child: Container(
        margin: EdgeInsets.symmetric(vertical: Sizes.dimen_10.h),
        child: Center(
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(enabled: false),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              axisTitleData: FlAxisTitleData(show: false),
              titlesData: FlTitlesData(show: false),
              lineBarsData: [
                LineChartBarData(
                  barWidth: Sizes.dimen_2.w,
                  colors: [ColorPalette.lima],
                  dotData: FlDotData(
                    show: false,
                  ),
                  belowBarData: BarAreaData(
                    show: false,
                  ),
                  spots: data.map((d) => FlSpot(d.d.toDouble(), d.c)).toList(),
                ),
              ],
            ),
            swapAnimationDuration: Duration(milliseconds: 300),
          ),
        ),
      ));
    });
  }

  Widget _buildMenu(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _menuItem(title: "1${TranslationConstants.day.t(context)[0]}", index: 0),
          _divider(),
          _menuItem(title: "1${TranslationConstants.week.t(context)[0]}", index: 1),
          _divider(),
          _menuItem(title: "1${TranslationConstants.month.t(context)[0]}", index: 2),
          _divider(),
          _menuItem(title: "3${TranslationConstants.month.t(context)[0]}", index: 3),
          _divider(),
          _menuItem(title: "1${TranslationConstants.year.t(context)[0]}", index: 4),
          _divider(),
          _menuItem(title: "5${TranslationConstants.year.t(context)[0]}", index: 5),
        ],
      ),
    );
  }

  Widget _menuItem({String title, int index}) {
    return Consumer<ChartProvider>(
      builder: (context, provider, child) {
        return GestureDetector(
          onTap: () {
            provider.setIndex(index);
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            decoration: BoxDecoration(
              color: index == provider.selectedIndex ? Colors.green : Colors.white,
              borderRadius: BorderRadius.circular(Sizes.dimen_10.sp),
            ),
            padding: EdgeInsets.all(Sizes.dimen_10.w),
            margin: index == provider.selectedIndex
                ? EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w)
                : EdgeInsets.symmetric(horizontal: Sizes.dimen_2.w),
            child: Text(title, style: TextStyle(color: index == provider.selectedIndex ? Colors.white : Colors.black)),
          ),
        );
      },
    );
  }

  Widget _divider() {
    return Container(
      height: Sizes.dimen_12.h,
      width: Sizes.dimen_1.w,
      color: Colors.grey,
    );
  }
}
