import 'dart:convert';
import 'dart:typed_data';
import 'package:movie_app_test/core/networking/hive_model.dart';
import 'package:movie_app_test/features/home/data/model/movie_response_model.dart';

import '../../doman/entities/movie_entity.dart';

class MovieMapper {
  // static MovieEntity toEntity(MovieResponseModel modelResult) {
  //   return MovieEntity(
  //     page: modelResult.page ?? 1,
  //     results: modelResult.results
  //         ?.map(
  //           (value) => MovieRemoteDataSourceEntity(
  //             adult: value.adult ?? true,
  //             genreIds: value.genreIds ?? [],
  //             id: value.id ?? 1,
  //             originalLanguage:
  //                 value.originalLanguage ?? "defaultOriginalLanguage",
  //             originalTitle: value.originalTitle ?? "defaultOriginalTitle",
  //             overview: value.overview ?? "defauiltOverview",
  //             popularity: value.popularity ?? 87.5911,
  //             releaseDate: value.releaseDate ?? "defaultReleaseDate",
  //             title: value.title ?? "defaultTitle",
  //             video: value.video ?? false,
  //             voteAverage: value.voteAverage ?? 4.0,
  //             voteCount: value.voteCount ?? 8,
  //           ),
  //         )
  //         .toList(),
  //     totalPages: modelResult.totalPages ?? 53350,
  //     totalResults: 1066987,
  //   );
  // }

  static MovieEntity to({required MovieResultModel movies}) {
    return MovieEntity(
      id: movies.id ?? 1,
      overview: movies.overview ?? "defaultOverView",
      popularity: movies.voteAverage ?? 81.7865,
      title: movies.title ?? "defaultTitle",
      posterPath: 'https://image.tmdb.org/t/p/w500${movies.posterPath}',
      // posterBytes: movies.posterPath
      // base64Decode(movies.posterPath.toString()),
      // convertImageUrlToBytes(movies.posterPath),
    );
  }

  // Synchronous helper that produces an empty byte array when no posterPath is available.
  // Replace this implementation with actual network fetching if you need real image bytes.
  static Uint8List convertImageUrlToBytes(String? posterPath) {
    if (posterPath == null || posterPath.isEmpty) {
      return Uint8List(0);
    }
    // Returning empty bytes for now to satisfy type requirements and compilation.
    return Uint8List(0);
  }
}
