import 'package:dartz/dartz.dart';
import 'package:laplace_chart/data/data_sources/remote_data_source.dart';
import 'package:laplace_chart/data/models/demo_model.dart';
import 'package:laplace_chart/domain/entities/app_error.dart';
import 'package:laplace_chart/domain/repositories/demo_repository.dart';

class DemoRepositoryImpl extends DemoRepository {
  final RemoteDataSource remoteDataSource;

  DemoRepositoryImpl(this.remoteDataSource);
  @override
  Future<Either<AppError,DemoModel>> getChartDemo() async {
    try {
      final demoModel = await remoteDataSource.getChartDemoData();
      return Right(demoModel);
    } on Exception {
      return Left(AppError("Something went wrong!"));
    }
  }
}
