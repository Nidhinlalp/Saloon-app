part of 'get_uid_bloc.dart';

sealed class GetUidState extends Equatable {
  const GetUidState();

  @override
  List<Object> get props => [];
}

final class GetUidInitial extends GetUidState {}

class GetSaloonUids extends GetUidState {
  final String uid;

  const GetSaloonUids(this.uid);
  @override
  List<Object> get props => [uid];
}

class GetFaild extends GetUidState {
  final String message;

  const GetFaild(this.message);
  @override
  List<Object> get props => [message];
}
