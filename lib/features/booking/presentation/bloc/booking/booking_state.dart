part of 'booking_bloc.dart';

abstract class BookingState extends Equatable {
  const BookingState();

  @override
  List<Object> get props => [];
}

final class BookingInitial extends BookingState {}

class BookingLoading extends BookingState {}

class BookingError extends BookingState {}

class BookingSuccess extends BookingState {}
