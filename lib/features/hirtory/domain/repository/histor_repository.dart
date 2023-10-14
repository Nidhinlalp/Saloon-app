import 'package:salloon_app/core/errorr/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:salloon_app/features/booking/domain/entities/booking_entities.dart';

abstract class HistoryRepository {
  Future<Either<Failure, List<BookingEntity>>> getBookedDetails();
}
