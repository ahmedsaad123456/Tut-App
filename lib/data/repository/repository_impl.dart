import 'package:dartz/dartz.dart';
import 'package:mvvm/data/data_source/local_data_source.dart';
import 'package:mvvm/data/data_source/remote_data_source.dart';
import 'package:mvvm/data/mapper/mapper.dart';
import 'package:mvvm/data/network/error_handler.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/data/network/netowrk_info.dart';
import 'package:mvvm/data/requests/request.dart';
import 'package:mvvm/domain/model/model.dart';
import 'package:mvvm/domain/repository/repository.dart';

class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final LocalDataSource _localDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(
      this._remoteDataSource, this._localDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the api
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return the data
          // return right
          return Right(response.toDomain());
        }
        // return biz logic error
        else {
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return conenction error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, String>> forgotPassword(String email) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the api
        final response = await _remoteDataSource.forgotPassword(email);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return the data
          // return right
          return Right(response.toDomain());
        }
        // return biz logic error
        else {
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return conenction error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, Authentication>> register(
      RegisterRequest registerRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        // its safe to call the api
        final response = await _remoteDataSource.register(registerRequest);
        if (response.status == ApiInternalStatus.SUCCESS) {
          // success
          // return the data
          // return right
          return Right(response.toDomain());
        }
        // return biz logic error
        else {
          // return left
          return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
              response.message ?? ResponseMessage.DEFAULT));
        }
      } catch (error) {
        return (Left(ErrorHandler.handle(error).failure));
      }
    } else {
      // return conenction error
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }

  @override
  Future<Either<Failure, HomeObject>> getHome() async {
    try {
      // get from cashe
      final response = await _localDataSource.getHomeData();
      return Right(response.toDomain());
    } catch (errorCashe) {
      // we have cashe error so we should call API

      if (await _networkInfo.isConnected) {
        try {
          // its safe to call the api
          final response = await _remoteDataSource.getHome();
          if (response.status == ApiInternalStatus.SUCCESS) {
            // success
            // return the data
            // return right
            // save response to local data source data source
            _localDataSource.saveHomeToCache(response);
            return Right(response.toDomain());
          }
          // return biz logic error
          else {
            // return left
            return Left(Failure(response.status ?? ApiInternalStatus.FAILURE,
                response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return (Left(ErrorHandler.handle(error).failure));
        }
      } else {
        // return conenction error
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
  
  @override
  Future<Either<Failure, StoreDetails>> getStoreDetails() async {
    try {
      // get data from cache

      final response = await _localDataSource.getStoreDetails();
      return Right(response.toDomain());
    } catch (cacheError) {
      if (await _networkInfo.isConnected) {
        try {
          final response = await _remoteDataSource.getStoreDetails();
          if (response.status == ApiInternalStatus.SUCCESS) {
            _localDataSource.saveStoreDetailsToCache(response);
            return Right(response.toDomain());
          } else {
            return Left(Failure(response.status ?? ResponseCode.DEFAULT,
                response.message ?? ResponseMessage.DEFAULT));
          }
        } catch (error) {
          return Left(ErrorHandler.handle(error).failure);
        }
      } else {
        return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
      }
    }
  }
}
