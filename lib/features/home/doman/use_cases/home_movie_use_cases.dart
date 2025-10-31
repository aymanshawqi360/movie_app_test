import 'package:movie_app_test/core/error/api_result.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';
import 'package:movie_app_test/features/home/doman/repo/home_repo.dart';

class HomeMovieUseCases {
  final HomeRepo homeRepo;

  HomeMovieUseCases({required this.homeRepo});

  Future<ApiResult<List<MovieEntity>>> getMovies({required int pageId}) {
    return homeRepo.getMovies(pageId: pageId);
  }
}
