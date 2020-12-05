import 'package:laplace_chart/data/core/api_client.dart';
import 'package:laplace_chart/data/models/demo_model.dart';

abstract class RemoteDataSource {
  Future<DemoModel> getChartDemoData();
}

class DemoRemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _client;

  DemoRemoteDataSourceImpl(this._client);

  @override
  Future<DemoModel> getChartDemoData() async {
    final response = await _client.get("demo");
    final demoModel = DemoModel.fromJson(response);
    print(demoModel);
    return demoModel;
  }
}
