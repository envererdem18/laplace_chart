import 'package:dartz/dartz.dart';
import 'package:laplace_chart/data/models/demo_model.dart';
import 'package:laplace_chart/domain/entities/app_error.dart';
import 'package:laplace_chart/domain/entities/no_params.dart';
import 'package:laplace_chart/domain/repositories/demo_repository.dart';
import 'package:laplace_chart/domain/usecases/usecase.dart';

class GetChartDemo extends UseCase<DemoModel, NoParams> {
  final DemoRepository demoRepository;

  GetChartDemo(this.demoRepository);

  @override
  Future<Either<AppError, DemoModel>> call(NoParams noParams) async {
    return await demoRepository.getChartDemo();
  }
}
