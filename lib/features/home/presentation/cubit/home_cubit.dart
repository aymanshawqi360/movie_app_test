import 'package:bloc/bloc.dart';
import 'package:movie_app_test/core/error/api_error_model.dart';
import 'package:movie_app_test/core/error/api_result.dart';

import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';
import 'package:movie_app_test/features/home/doman/use_cases/home_movie_use_cases.dart';
import 'package:movie_app_test/features/home/presentation/cubit/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeMovieUseCases homeMovieUseCases;
  HomeCubit({required this.homeMovieUseCases}) : super(HomeInitial());

  final List<MovieEntity> _movieList = [];
  int pageId = 1;

  List<MovieEntity> get movies => _movieList;
  Future<void> movieState({bool isRefrash = false}) async {
    if (!isRefrash) {
      emit(HomeLoading());
    }
    ApiResult<List<MovieEntity>> response = await homeMovieUseCases.getMovies(
      pageId: pageId,
    );
    if (response is Success<List<MovieEntity>>) {
      if (response.data!.isNotEmpty) {
        pageId++;
        _movieList.addAll(response.data ?? []);
      }
      emit(HomeSuccess(movies: response.data ?? []));
    } else if (response is Failure<List<MovieEntity>>) {
      emit(
        HomeFailure(
          errorMessage: ApiErrorModel(
            errorMessage: response.errorMessage.errorMessage,
            errors: response.errorMessage.errors,
          ),
        ),
      );
    }
  }
}
