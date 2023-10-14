// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
part of 'booking_bloc.dart';

abstract class BookingEvent extends Equatable {
  const BookingEvent();

  @override
  List<Object> get props => [];
}

class HandleRazorPay extends BookingEvent {
  BuildContext context;
  HandleRazorPay({
    required this.context,
  });
  @override
  List<Object> get props => [context];
}

class BookingTheSaloon extends BookingEvent {
  final BookingModel bookingModel;
  final String uid;
  const BookingTheSaloon({
    required this.bookingModel,
    required this.uid,
  });
  @override
  List<Object> get props => [bookingModel];
}
