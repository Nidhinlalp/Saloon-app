// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:salloon_app/features/booking/domain/entities/booking_entities.dart';
import 'package:salloon_app/features/hirtory/domain/usecase/history_usecase.dart';

part 'history_event.dart';
part 'history_state.dart';

class HistoryBloc extends Bloc<HistoryEvent, HistoryState> {
  final HistoryUsecase _historyUsecase;
  HistoryBloc(
    this._historyUsecase,
  ) : super(HistoryInitial()) {
    on<GetHistory>((event, emit) async {
      emit(HistoryLoading());

      final result = await _historyUsecase.execurte();

      result.fold((failure) {
        emit(HistoryGetFaild(failure.message));
      }, (bookingData) => emit(HistoryGetState(bookingData)));
    });
  }
}
