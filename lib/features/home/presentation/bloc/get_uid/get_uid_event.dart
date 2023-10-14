part of 'get_uid_bloc.dart';

sealed class GetUidEvent extends Equatable {
  const GetUidEvent();

  @override
  List<Object> get props => [];
}

class GetSaloonUid extends GetUidEvent {}
