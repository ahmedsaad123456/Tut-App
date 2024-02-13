import 'package:dartz/dartz.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/data/requests/request.dart';
import 'package:mvvm/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure ,Authentication>> login(LoginRequest loginRequest);

  
}
