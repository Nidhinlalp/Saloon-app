import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:salloon_app/features/auth/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/auth/data/repository/user_repository_impl.dart';
import 'package:salloon_app/features/auth/domain/repository/user_repository.dart';
import 'package:salloon_app/features/auth/domain/usecases/user_login_usecase.dart';
import 'package:salloon_app/features/auth/presentation/bloc/auth/auth_bloc.dart';
import 'package:salloon_app/features/booking/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/booking/data/repository/booking_repository_imp.dart';
import 'package:salloon_app/features/booking/domain/repository/booking_repository.dart';
import 'package:salloon_app/features/booking/domain/usecases/booking_usecase.dart';
import 'package:salloon_app/features/booking/presentation/bloc/booking/booking_bloc.dart';
import 'package:salloon_app/features/hirtory/data/data_source/remote/remote_data_source.dart';
import 'package:salloon_app/features/hirtory/data/repository/history_repository_impl.dart';
import 'package:salloon_app/features/hirtory/domain/repository/histor_repository.dart';
import 'package:salloon_app/features/hirtory/domain/usecase/history_usecase.dart';
import 'package:salloon_app/features/hirtory/presentation/bloc/history/history_bloc.dart';
import 'package:salloon_app/features/home/data/data_source/remote/remote_datasource.dart';
import 'package:salloon_app/features/home/data/repository/saloon_reposiotory_impl.dart';
import 'package:salloon_app/features/home/domain/repository/saloon_repository.dart';
import 'package:salloon_app/features/home/domain/usecase/saloon_usecase.dart';
import 'package:salloon_app/features/home/presentation/bloc/get_uid/get_uid_bloc.dart';
import 'package:salloon_app/features/home/presentation/bloc/saloon/saloon_bloc.dart';

final locator = GetIt.instance;

void setUpLoacator() {
  //bloc

  locator.registerFactory(() => AuthBloc(locator()));
  locator.registerFactory(() => SaloonBloc(
        locator(),
      ));
  locator.registerFactory(() => BookingBloc(locator(), locator()));
  locator.registerFactory(() => HistoryBloc(locator()));
  locator.registerFactory(() => GetUidBloc(locator()));

  // usecase

  locator.registerLazySingleton(() => UserLoginUsecase(locator()));
  locator.registerLazySingleton(() => SaloonUsecase(locator()));
  locator.registerLazySingleton(() => BookingUsecase(locator()));
  locator.registerLazySingleton(() => HandleRazorPayUsecase(locator()));
  locator.registerLazySingleton(() => HistoryUsecase(locator()));
  locator.registerLazySingleton(() => SaloonGetUidUsecase(locator()));

  // repositories

  locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(userLoginRemoteDataSource: locator()));

  locator.registerLazySingleton<SaloonRepository>(
      () => SaloonRepositoryImpl(saloonRemoteDataSource: locator()));

  locator.registerLazySingleton<BookingRepository>(
      () => BookingRepositoryImpl(bookingRemoteDataSource: locator()));

  locator.registerLazySingleton<HistoryRepository>(
      () => HistoryRepositoryImpl(historyRemoteDataSource: locator()));

  // data source

  locator.registerLazySingleton<UserLoginRemoteDataSource>(
      () => UserLoginRemoteDataSourceImpl(locator(), locator()));

  locator.registerLazySingleton<SaloonRemoteDataSource>(
      () => SaloonRemoteDataSourceImpl(locator()));

  locator.registerLazySingleton<BookingRemoteDataSource>(
      () => BookingRemoteDataSourceImpl(locator(), locator()));

  locator.registerLazySingleton<HistoryRemoteDataSource>(
      () => HistoryRemoteDataSourceImpl(locator(), locator()));

  // External

  final firebaseFirestore = FirebaseFirestore.instance;
  final firebaseAuth = FirebaseAuth.instance;

  locator.registerLazySingleton(() => firebaseFirestore);
  locator.registerLazySingleton(() => firebaseAuth);
}
