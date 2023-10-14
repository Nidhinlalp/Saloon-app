import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';

abstract class SaloonRepository {
  Future<Either<Failure, List<SaloonEntity>>> getSaloonsList();
  Future<Either<Failure, String>> getSaloonUid();
}
