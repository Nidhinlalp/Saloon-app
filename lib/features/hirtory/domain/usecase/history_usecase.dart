import 'package:dartz/dartz.dart';
import 'package:salloon_app/core/errorr/failure.dart';
import 'package:salloon_app/features/booking/domain/entities/booking_entities.dart';
import 'package:salloon_app/features/hirtory/domain/repository/histor_repository.dart';

class HistoryUsecase {
  final HistoryRepository historyRepository;

  HistoryUsecase(this.historyRepository);

  Future<Either<Failure, List<BookingEntity>>> execurte() =>
      historyRepository.getBookedDetails();
}
