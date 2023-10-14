// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:salloon_app/features/home/domain/entities/saloon_entity.dart';
import 'package:salloon_app/features/home/domain/usecase/saloon_usecase.dart';

part 'saloon_event.dart';
part 'saloon_state.dart';

class SaloonBloc extends Bloc<SaloonEvent, SaloonState> {
  final SaloonUsecase _saloonUsecase;
  SaloonBloc(
    this._saloonUsecase,
  ) : super(SaloonInitial()) {
    on<GetSaloonsList>((event, emit) async {
      emit(SaloonListLoading());

      final result = await _saloonUsecase.execurte();

      result.fold((failure) {
        log(failure.message.toString());
        emit(
          SaloonListGetFaild(failure.message),
        );
      }, (saloonEntity) {
        log(saloonEntity.toString());
        emit(
          SaloonListGet(saloonEntity),
        );
      });
    });
  }
}
