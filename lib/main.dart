import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';
import 'di/get_it.dart' as getIt;

import 'presentation/screens/home/providers/chart_provider.dart';
import 'presentation/screens/laplace_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  unawaited(getIt.init());
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ChartProvider(), lazy: true),
  ], child: LaplaceApp()));
}
