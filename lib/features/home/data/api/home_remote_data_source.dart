import 'package:dio/dio.dart';
import 'package:movie_app_test/core/networking/dio_factory.dart';
import 'package:movie_app_test/features/home/data/api/home_api_constants.dart';

class HomeRemoteDataSoutce {
  final DioFactory dioFactory;

  HomeRemoteDataSoutce({required this.dioFactory});

  Future<Response> getMovies({required int pageId}) {
    try {
      final result = dioFactory.get(
        HomeApiConstants.movie + HomeApiConstants.popular,
        queryParametes: {
          HomeApiConstants.apiKey: HomeApiConstants.apiValue,
          HomeApiConstants.languageKey: HomeApiConstants.languageValue,
          HomeApiConstants.page: pageId,
        },
      );
      return result;
    } catch (_) {
      rethrow;
    }
  }
}
