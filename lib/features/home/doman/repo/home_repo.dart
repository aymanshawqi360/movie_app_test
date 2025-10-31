import 'package:movie_app_test/core/error/api_result.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

abstract class HomeRepo {
  Future<ApiResult<List<MovieEntity>>> getMovies({required int pageId});
}
