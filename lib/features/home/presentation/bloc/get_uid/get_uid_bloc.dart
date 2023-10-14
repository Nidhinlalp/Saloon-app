// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:salloon_app/features/home/domain/usecase/saloon_usecase.dart';

part 'get_uid_event.dart';
part 'get_uid_state.dart';

class GetUidBloc extends Bloc<GetUidEvent, GetUidState> {
  final SaloonGetUidUsecase _getUidUsecase;
  GetUidBloc(
    this._getUidUsecase,
  ) : super(GetUidInitial()) {
    on<GetUidEvent>((event, emit) async {
      final result = await _getUidUsecase.execurte();

      result.fold(
          (l) => emit(GetFaild(l.message)), (r) => emit(GetSaloonUids(r)));
    });
  }
}
