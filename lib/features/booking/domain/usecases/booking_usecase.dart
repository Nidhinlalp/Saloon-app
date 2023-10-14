// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';
import 'package:salloon_app/features/booking/domain/repository/booking_repository.dart';

class BookingUsecase {
  final BookingRepository bookingRepository;

  BookingUsecase(this.bookingRepository);

  void execurte(BookingModel bookingModel, String uid) =>
      bookingRepository.bookingTheSaloon(bookingModel, uid);
}

class HandleRazorPayUsecase {
  final BookingRepository bookingRepository;

  HandleRazorPayUsecase(this.bookingRepository);

  void execurte(BuildContext context) =>
      bookingRepository.handleRazorPay(context);
}

class IsBookingStatusUsecase {
  final BookingRepository bookingRepository;
  IsBookingStatusUsecase(this.bookingRepository);
}
