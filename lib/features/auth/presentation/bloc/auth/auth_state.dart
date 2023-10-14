part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class GoogleAuthInitialState extends AuthState {}

class GoogelAuthLoadingState extends AuthState {}

class GoogleSuccessStateState extends AuthState {
  final UserEntity user;
  const GoogleSuccessStateState(this.user);
  @override
  List<Object> get props => [user];
}

class GoogleAuthFaildState extends AuthState {
  final String message;
  const GoogleAuthFaildState(this.message);
  @override
  List<Object> get props => [message];
}
