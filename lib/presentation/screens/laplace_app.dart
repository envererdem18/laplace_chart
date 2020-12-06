import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:laplace_chart/core/constants/languages.dart';
import 'package:laplace_chart/core/utils/screen_utils/screen_util.dart';
import 'package:laplace_chart/di/get_it.dart';
import 'package:laplace_chart/presentation/app_localizations.dart';
import 'package:laplace_chart/presentation/bolcs/language_bloc/language_bloc.dart';
import 'package:laplace_chart/presentation/core/routes/route_service.dart';
import 'package:laplace_chart/presentation/core/routes/routes.dart';
import 'package:provider/provider.dart';

import 'home/providers/chart_provider.dart';

class LaplaceApp extends StatefulWidget {
  @override
  _LaplaceAppState createState() => _LaplaceAppState();
}

class _LaplaceAppState extends State<LaplaceApp> {
  LanguageBloc _languageBloc;

  @override
  void initState() {
    super.initState();
    _languageBloc = getItInstance<LanguageBloc>();
  }

  @override
  void dispose() {
    _languageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ChartProvider(), lazy: true),
          BlocProvider<LanguageBloc>.value(value: _languageBloc),
        ],
        child: LayoutBuilder(
          builder: (context, constraints) {
            ScreenUtil.init(height: constraints.maxHeight, width: constraints.maxWidth);
            return BlocBuilder<LanguageBloc, LanguageState>(builder: (context, state) {
              if (state is LanguageLoaded) {
                return MaterialApp(
                  title: 'Flutter Demo',
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: Colors.green,
                    visualDensity: VisualDensity.adaptivePlatformDensity,
                  ),
                  supportedLocales: Languages.languages.map((e) => Locale(e.code)).toList(),
                  locale: state.locale,
                  localizationsDelegates: [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                  ],
                  onGenerateRoute: Routes.instance.generateRoute,
                  navigatorKey: RouteService.instance.navigatorKey,
                );
              }
              return const SizedBox.shrink();
            });
          },
        ));
  }
}
