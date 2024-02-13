import 'package:mvvm/app/constant.dart';
import 'package:mvvm/data/responses/responses.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {

  // factory constructor to create one instance from this class when called multiple times
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("/customers/login")
  Future<AuthenticationResponse> login(
    @Field("email") String email,
    @Field("password") String password,
    @Field("imei") String imei,
    @Field("deviceType") String deviceType,
  );
}
