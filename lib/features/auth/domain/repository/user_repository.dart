import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/auth/domain/entities/user_entite.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure, UserEntity>> googelLogin();
}
