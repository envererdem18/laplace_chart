import 'package:flutter/material.dart';
import 'package:laplace_chart/core/utils/screen_utils/screen_util.dart';
import 'package:laplace_chart/presentation/core/routes/route_service.dart';
import 'package:laplace_chart/presentation/core/routes/routes.dart';

class LaplaceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        ScreenUtil.init(height: constraints.maxHeight, width: constraints.maxWidth);
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: Routes.instance.generateRoute,
          navigatorKey: RouteService.instance.navigatorKey,
        );
      },
    );
  }
}
