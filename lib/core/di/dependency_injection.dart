import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_app_test/core/networking/dio_factory.dart';
import 'package:movie_app_test/core/networking/network_info.dart';
import 'package:movie_app_test/features/home/data/api/home_local_data_source.dart';
import 'package:movie_app_test/features/home/data/api/home_remote_data_source.dart';
import 'package:movie_app_test/features/home/data/repo_impl/home_repo_implementation.dart';
import 'package:movie_app_test/features/home/doman/repo/home_repo.dart';
import 'package:movie_app_test/features/home/doman/use_cases/home_movie_use_cases.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_cubit.dart';

final sl = GetIt.instance;

Future<void> setup() async {
  //!NetWorking
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<DioFactory>(() => DioFactory(dio: sl()));

  //!Data/
  //Api
  sl.registerLazySingleton<HomeRemoteDataSoutce>(
    () => HomeRemoteDataSoutce(dioFactory: sl()),
  );
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker.createInstance(),
  );
  sl.registerLazySingleton<NetworkInfo>(
    () => NetWorkInfoImpl(internetConnectionChecker: sl()),
  );

  //RepoImplementation

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImplementation(
      homeApiService: sl(),
      homeLocalDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //!UseCases
  sl.registerLazySingleton<HomeMovieUseCases>(
    () => HomeMovieUseCases(homeRepo: sl()),
  );

  //!cubit
  sl.registerFactory(() => HomeCubit(homeMovieUseCases: sl()));
}
