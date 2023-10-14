part of 'saloon_bloc.dart';

abstract class SaloonEvent extends Equatable {
  const SaloonEvent();

  @override
  List<Object> get props => [];
}

class GetSaloonsList extends SaloonEvent {}
