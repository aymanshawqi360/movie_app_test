import 'package:dio/dio.dart';
import 'package:movie_app_test/core/error/api_error_hundler.dart';
import 'package:movie_app_test/core/error/api_result.dart';
import 'package:movie_app_test/core/networking/hive_model.dart';
import 'package:movie_app_test/core/networking/network_info.dart';
import 'package:movie_app_test/features/home/data/api/home_local_data_source.dart';
import 'package:movie_app_test/features/home/data/api/home_remote_data_source.dart';
import 'package:movie_app_test/features/home/data/mappers/home_mappers.dart';
import 'package:movie_app_test/features/home/data/model/movie_response_model.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';
import 'package:movie_app_test/features/home/doman/repo/home_repo.dart';

class HomeRepoImplementation implements HomeRepo {
  final HomeRemoteDataSoutce homeApiService;
  final HomeLocalDataSource homeLocalDataSource;
  final NetworkInfo networkInfo;

  HomeRepoImplementation({
    required this.homeLocalDataSource,
    required this.networkInfo,
    required this.homeApiService,
  });
  @override
  Future<ApiResult<List<MovieEntity>>> getMovies({required int pageId}) async {
    try {
      if (await networkInfo.isConnected) {
        Response result = await homeApiService.getMovies(pageId: pageId);
        List<MovieEntity> movies = movieMapper(result: result);
        homeLocalDataSource.getLastMovies(movieRemoteDataSourceEntity: movies);
        return ApiResult.success(movies);
      } else {
        return ApiResult.success(homeLocalDataSource.checkMovie());
      }
    } catch (error) {
      return ApiResult.failure(ApiErrorHundler.apiHandler(error));
    }
  }

  List<MovieEntity> movieMapper({required Response result}) {
    MovieResponseModel response = MovieResponseModel.fromJson(result.data);
    List<MovieEntity>? movie = response.results
        ?.map((value) => MovieMapper.to(movies: value))
        .toList();

    return movie ?? [];
  }
}
