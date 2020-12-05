import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:laplace_chart/data/core/api_client.dart';
import 'package:laplace_chart/data/data_sources/remote_data_source.dart';
import 'package:laplace_chart/data/repositories/demo_repository_impl.dart';
import 'package:laplace_chart/domain/repositories/demo_repository.dart';
import 'package:laplace_chart/domain/usecases/get_chart_demo.dart';

final getItInstance = GetIt.I;

// Dependency Injection
Future init() async {
  /// All dependencies goes here
  getItInstance.registerLazySingleton<Client>(() => Client());
  getItInstance.registerLazySingleton<ApiClient>(() => ApiClient(getItInstance()));
  getItInstance.registerLazySingleton<RemoteDataSource>(() => DemoRemoteDataSourceImpl(getItInstance()));
  getItInstance.registerLazySingleton<DemoRepository>(() => DemoRepositoryImpl(getItInstance()));
  getItInstance.registerLazySingleton<GetChartDemo>(() => GetChartDemo(getItInstance()));
}
