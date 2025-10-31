import 'package:movie_app_test/core/networking/hive_service.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

abstract class HomeLocalDataSource {
  void getLastMovies({required List<MovieEntity> movieRemoteDataSourceEntity});
  List<MovieEntity> checkMovie();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  void getLastMovies({required List<MovieEntity> movieRemoteDataSourceEntity}) {
    HiveService.addToHive(movieRemoteDataSourceEntity);
  }

  @override
  List<MovieEntity> checkMovie() {
    return HiveService.saveData();
  }
}
