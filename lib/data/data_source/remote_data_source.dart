import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/app_api.dart';
import 'package:mvvm/data/requests/request.dart';
import 'package:mvvm/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password, EMPTY, EMPTY);
  }
}
