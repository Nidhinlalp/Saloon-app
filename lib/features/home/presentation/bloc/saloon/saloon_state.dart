part of 'saloon_bloc.dart';

abstract class SaloonState extends Equatable {
  const SaloonState();

  @override
  List<Object> get props => [];
}

class SaloonInitial extends SaloonState {}

class SaloonListLoading extends SaloonState {}

class SaloonListGet extends SaloonState {
  final List<SaloonEntity> saloonEntity;

  const SaloonListGet(this.saloonEntity);
  @override
  List<Object> get props => [saloonEntity];
}

class SaloonListGetFaild extends SaloonState {
  final String message;

  const SaloonListGetFaild(this.message);
  @override
  List<Object> get props => [message];
}
