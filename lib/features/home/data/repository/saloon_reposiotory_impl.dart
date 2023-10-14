// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/exeption.dart';

import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/home/data/data_source/remote/remote_datasource.dart';
import 'package:salloon_app/features/home/data/model/saloon_model.dart';
import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';
import 'package:salloon_app/features/home/domain/repository/saloon_repository.dart';

class SaloonRepositoryImpl extends SaloonRepository {
  final SaloonRemoteDataSource saloonRemoteDataSource;
  SaloonRepositoryImpl({
    required this.saloonRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<SaloonEntity>>> getSaloonsList() async {
    try {
      final result = await saloonRemoteDataSource.getSaloonsList();

      return Right(SaloonModel.toListOfEntity(result));
    } on FirebaseException {
      return const Left(ServerFailure("An error has occurred"));
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }

  @override
  Future<Either<Failure, String>> getSaloonUid() async {
    try {
      final result = await saloonRemoteDataSource.getSaloonuid();
      return Right(result);
    } on FirebaseException {
      return const Left(ServerFailure("An error has occurred"));
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
