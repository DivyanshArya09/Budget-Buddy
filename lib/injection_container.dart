import 'package:cipherx_expense_tracker_app/auth/repositories/auth_repository.dart';
import 'package:cipherx_expense_tracker_app/auth/services/local/local_data_sources.dart';
import 'package:cipherx_expense_tracker_app/auth/services/remote/remote_data_sources.dart';
import 'package:cipherx_expense_tracker_app/home/services/remote/home_remote_data_sources.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! registering shared preferences
  final sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! registering local data source
  sl.registerLazySingleton<LocalDataSource>(
      () => LocalDataSource(sharedPreferences: sl()));

  //! registering remote data source
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource());

  //! registering auth repository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepository(
      authRemoteDataSource: sl(),
      localDataSource: sl(),
    ),
  );

  //! registering auth repository
  sl.registerLazySingleton<HomeRemoteDataSources>(
    () => HomeRemoteDataSources(
      authLocalDataSource: sl(),
    ),
  );
}
