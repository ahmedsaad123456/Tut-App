import 'package:dartz/dartz.dart';
import 'package:mvvm/data/network/failure.dart';
import 'package:mvvm/domain/model/model.dart';
import 'package:mvvm/domain/repository/repository.dart';
import 'package:mvvm/domain/usecase/base_usecase.dart';

class HomeUseCase implements BaseUseCase<void, HomeObject> {
  final Repository _repository;

  HomeUseCase(this._repository);

  @override
  Future<Either<Failure, HomeObject>> execute(void input) async {
    return await _repository.getHome();
  }
}
