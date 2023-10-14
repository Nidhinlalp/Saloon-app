import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:salloon_app/features/auth/domain/entities/user_entite.dart';
import 'package:salloon_app/features/auth/domain/usecases/user_login_usecase.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserLoginUsecase _loginUsecase;
  AuthBloc(
    this._loginUsecase,
  ) : super(GoogleAuthInitialState()) {
    on<LoginPressed>((event, emit) async {
      emit(GoogelAuthLoadingState());

      final result = await _loginUsecase.execurte();

      result.fold(
        (failure) {
          print(failure.message);
          emit(GoogleAuthFaildState(failure.message));
        },
        (user) => emit(
          GoogleSuccessStateState(user),
        ),
      );
    });
  }
}
