import 'package:flutter/cupertino.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';

abstract class BookingRepository {
  void bookingTheSaloon(BookingModel bookingModel, String uid);
  void handleRazorPay(BuildContext context);
}
