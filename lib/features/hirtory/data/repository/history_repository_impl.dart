import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/exeption.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';
import 'package:salloon_app/features/booking/domain/entities/booking_entities.dart';
import 'package:salloon_app/features/hirtory/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/hirtory/domain/repository/histor_repository.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final HistoryRemoteDataSource historyRemoteDataSource;

  HistoryRepositoryImpl({required this.historyRemoteDataSource});
  @override
  Future<Either<Failure, List<BookingEntity>>> getBookedDetails() async {
    try {
      final result = await historyRemoteDataSource.getBookedDetails();

      return Right(BookingModel.toListOfEntity(result));
    } on FirebaseException {
      return const Left(ServerFailure("An error has occurred"));
    } on ServerException {
      return const Left(ServerFailure('An error has occurred'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to the network'));
    }
  }
}
