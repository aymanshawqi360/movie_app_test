import 'package:equatable/equatable.dart';
import 'package:movie_app_test/core/error/api_error_model.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<MovieEntity> movies;

  const HomeSuccess({required this.movies});
  @override
  List<Object> get props => [movies];
}

class HomeFailure extends HomeState {
  final ApiErrorModel errorMessage;

  const HomeFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
