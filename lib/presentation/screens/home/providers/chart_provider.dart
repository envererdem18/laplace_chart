import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:laplace_chart/data/models/1a.dart';
import 'package:laplace_chart/data/models/1g.dart';
import 'package:laplace_chart/data/models/1h.dart';
import 'package:laplace_chart/data/models/1y.dart';
import 'package:laplace_chart/data/models/3a.dart';
import 'package:laplace_chart/data/models/5y.dart';
import 'package:laplace_chart/data/models/demo_model.dart';
import 'package:laplace_chart/data/models/i_data.dart';
import 'package:laplace_chart/domain/entities/app_error.dart';
import 'package:laplace_chart/domain/entities/no_params.dart';
import 'package:laplace_chart/domain/usecases/get_chart_demo.dart';
import 'package:laplace_chart/di/get_it.dart' as getIt;

class ChartProvider extends ChangeNotifier {
  int _selectedIndex;
  DemoModel _demoModel;
  List<OneA> _oneA;
  List<OneG> _oneG;
  List<OneH> _oneH;
  List<OneY> _oneY;
  List<ThreeA> _threeA;
  List<FiveY> _fiveY;

  bool _isLoading;

  ChartProvider() {
    _selectedIndex = 0;
    _isLoading = true;
    _load();
  }

  // Getters
  DemoModel get demoModel => _demoModel;
  List<OneA> get oneA => _oneA;
  List<OneG> get oneG => _oneG;
  List<OneH> get oneH => _oneH;
  List<OneY> get oneY => _oneY;
  List<ThreeA> get threeA => _threeA;
  List<FiveY> get fiveY => _fiveY;
  bool get isLoading => _isLoading;
  int get selectedIndex => _selectedIndex;
  List<DataModel> get data => _getData() ?? [DataModel(1, 1.0), DataModel(1, 1.0)];

  // Setters
  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  void setIsLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _load() {
    setIsLoading(true);
    getModel();
    setIsLoading(false);
  }

  void getModel() async {
    GetChartDemo getChartDemo = getIt.getItInstance<GetChartDemo>();
    final Either<AppError, DemoModel> eitherResponse = await getChartDemo(NoParams());
    eitherResponse.fold((l) {
      print("error");
    }, (r) {
      print("successful");
      _demoModel = r;
      _oneA = r.l1A;
      _oneG = r.l1G;
      _oneH = r.l1H;
      _oneY = r.l1Y;
      _threeA = r.l3A;
      _fiveY = r.l5Y;
    });
    notifyListeners();
  }

  List _getData() {
    if (selectedIndex == 0) return _data(oneG);
    if (selectedIndex == 1) return _data(oneH);
    if (selectedIndex == 2) return _data(oneA);
    if (selectedIndex == 3) return _data(threeA);
    if (selectedIndex == 4) return _data(oneY);
    if (selectedIndex == 5) return _data(fiveY);

    return null;
  }

  List<DataModel> _data(List<IData> data) {
    return data.map((d) => DataModel(d.d, d.c)).toList();
  }
}

class DataModel {
  final int d;
  final double c;

  DataModel(this.d, this.c);
}
