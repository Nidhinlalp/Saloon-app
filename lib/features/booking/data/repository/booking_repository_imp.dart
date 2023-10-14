import 'package:flutter/cupertino.dart';
import 'package:salloon_app/features/booking/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';
import 'package:salloon_app/features/booking/domain/repository/booking_repository.dart';

class BookingRepositoryImpl extends BookingRepository {
  final BookingRemoteDataSource bookingRemoteDataSource;

  BookingRepositoryImpl({required this.bookingRemoteDataSource});
  @override
  void bookingTheSaloon(BookingModel bookingModel, String uid) =>
      bookingRemoteDataSource.bookingTheSaloon(bookingModel, uid);

  @override
  void handleRazorPay(BuildContext context) =>
      bookingRemoteDataSource.handleRazorPay(context);
}
