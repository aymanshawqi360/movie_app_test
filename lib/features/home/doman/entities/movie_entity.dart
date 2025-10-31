import 'package:hive_ce/hive.dart';

part 'movie_entity.g.dart';

@HiveType(typeId: 0)
class MovieEntity extends HiveObject {
  @HiveField(0)
  final int? id;
  @HiveField(1)
  final String? overview;
  @HiveField(2)
  final double? popularity;
  @HiveField(3)
  final String? posterPath;
  @HiveField(4)
  final String? title;

  MovieEntity({
    required this.id,
    required this.overview,
    required this.popularity,
    this.posterPath,
    required this.title,
  });
}
