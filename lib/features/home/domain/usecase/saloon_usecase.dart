import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';
import 'package:salloon_app/features/home/domain/repository/saloon_repository.dart';

class SaloonUsecase {
  final SaloonRepository saloonRepository;
  SaloonUsecase(this.saloonRepository);

  Future<Either<Failure, List<SaloonEntity>>> execurte() =>
      saloonRepository.getSaloonsList();
}

class SaloonGetUidUsecase {
  final SaloonRepository saloonRepository;

  SaloonGetUidUsecase(this.saloonRepository);

  Future<Either<Failure, String>> execurte() => saloonRepository.getSaloonUid();
}
