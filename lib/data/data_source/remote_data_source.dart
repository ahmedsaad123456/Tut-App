import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/app_api.dart';
import 'package:mvvm/data/requests/request.dart';
import 'package:mvvm/data/responses/responses.dart';

//================================================================================================================

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
  Future<ForgotPasswordResponse> forgotPassword(String email);
  Future<AuthenticationResponse> register(RegisterRequest registerRequest);
  Future<HomeResponse> getHome();
  Future<StoreDetailsResponse> getStoreDetails();
}

//================================================================================================================

class RemoteDataSourceImplementer implements RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImplementer(this._appServiceClient);

  //================================================================================================================

  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _appServiceClient.login(
        loginRequest.email, loginRequest.password, EMPTY, EMPTY);
  }

  //================================================================================================================

  @override
  Future<ForgotPasswordResponse> forgotPassword(String email) async {
    return await _appServiceClient.forgotPassword(email);
  }

  //================================================================================================================

  @override
  Future<AuthenticationResponse> register(
      RegisterRequest registerRequest) async {
    return await _appServiceClient.register(
        registerRequest.countryMobileCode,
        registerRequest.userName,
        registerRequest.email,
        registerRequest.password,
        registerRequest.mobileNumber,
        "");
  }

  //================================================================================================================

  @override
  Future<HomeResponse> getHome() async {
    return await _appServiceClient.getHome();
  }

  //================================================================================================================

  @override
  Future<StoreDetailsResponse> getStoreDetails() async {
    return await _appServiceClient.getStoreDetails();
  }

  //================================================================================================================
}
