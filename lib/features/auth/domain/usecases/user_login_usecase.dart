import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/auth/domain/entities/user_entite.dart';
import 'package:salloon_app/features/auth/domain/repository/user_repository.dart';

class UserLoginUsecase {
  final UserRepository userRepository;

  UserLoginUsecase(this.userRepository);

  Future<Either<Failure, UserEntity>> execurte() =>
      userRepository.googelLogin();
}
