import 'package:dartz/dartz.dart';
import 'package:laplace_chart/data/models/demo_model.dart';
import 'package:laplace_chart/domain/entities/app_error.dart';

abstract class DemoRepository {
  Future<Either<AppError, DemoModel>> getChartDemo();
}
