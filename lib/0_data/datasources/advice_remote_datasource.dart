import 'package:http/http.dart' as http;
import 'package:performx/0_data/network/network_manager.dart';

import '../../injection.dart';
import '../models/advice_model.dart';

abstract class AdviceRemoteDatasource {
  /// requests a random advice from api
  /// returns [AdviceModel] if successfull
  /// throws a server-Exception if status code is not 200
  Future<AdviceModel> getAdvice();
}

class AdviceRemoteDatasourceImpl implements AdviceRemoteDatasource {
  final http.Client client;
  AdviceRemoteDatasourceImpl({required this.client});
  @override
  Future<AdviceModel> getAdvice() async {
    final response = await sl<NetworkManager>().apiClient.getAdvice();
    return response;
  }
}
