import 'package:dartz/dartz.dart';
import 'package:mvvm/data/data_source/remote_data_source.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/data/network/netowrk_info.dart';
import 'package:mvvm/data/requests/request.dart';
import 'package:mvvm/domain/model.dart';
import 'package:mvvm/domain/repository.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its safe to call the api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // success
        // return the data
        // return right
        return Right(response.toDomain());
      }
      // return biz logic error
      else {
        // return left
        return Left(Failure(
            409, response.message ?? "we have biz error logic from API side"));
      }
    } else {
      // return conenction error
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}