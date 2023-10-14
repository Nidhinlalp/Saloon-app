part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState();

  @override
  List<Object> get props => [];
}

final class HistoryInitial extends HistoryState {}

class HistoryLoading extends HistoryState {}

class HistoryGetState extends HistoryState {
  final List<BookingEntity> bookingData;

  const HistoryGetState(this.bookingData);
  @override
  List<Object> get props => [bookingData];
}

class HistoryGetFaild extends HistoryState {
  final String message;

  const HistoryGetFaild(this.message);
  @override
  List<Object> get props => [message];
}
