import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:salloon_app/features/booking/data/model/booking_model.dart';

import 'package:salloon_app/features/booking/domain/usecases/booking_usecase.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  final BookingUsecase _bookingUsecase;
  final HandleRazorPayUsecase _handleRazorPayUsecase;
  BookingBloc(
    this._bookingUsecase,
    this._handleRazorPayUsecase,
  ) : super(BookingInitial()) {
    on<BookingTheSaloon>((event, emit) {
      emit(BookingLoading());

      _bookingUsecase.execurte(event.bookingModel, event.uid);
    });

    on<HandleRazorPay>((event, emit) {
      _handleRazorPayUsecase.execurte(event.context);
    });
  }
}
