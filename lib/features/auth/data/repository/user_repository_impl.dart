import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:salloon_app/core/errorr/exeption.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/auth/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/auth/domain/entities/user_entite.dart';
import 'package:salloon_app/features/auth/domain/repository/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserLoginRemoteDataSource userLoginRemoteDataSource;

  UserRepositoryImpl({required this.userLoginRemoteDataSource});
  @override
  Future<Either<Failure, UserEntity>> googelLogin() async {
    try {
      final result = await userLoginRemoteDataSource.userLogin();

      return Right(result.toEntity());
    } on FirebaseException {
      return const Left(ServerFailure("An error has occurred"));
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
