import 'package:flutter/material.dart';
import 'package:movie_app_test/core/util/assets_manager.dart';
import 'package:movie_app_test/core/widget/app_cahed_network_image.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

class MovieCard extends StatelessWidget {
  final MovieEntity movieLocalDataSourceEntity;
  const MovieCard({super.key, required this.movieLocalDataSourceEntity});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(8),
            ),
            child: AppCahedNetworkImage(
              fit: BoxFit.cover,
              image:
                  movieLocalDataSourceEntity.posterPath ??
                  AssetsManager.imageNotFound,

              placeholder: const Icon(
                Icons.image_rounded,
                color: Colors.white38,
                size: 28,
              ),
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieLocalDataSourceEntity.title.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 16),
                    SizedBox(width: 4),
                    Text(
                      "${movieLocalDataSourceEntity.popularity?.toInt().toString()}/10",

                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black26,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    "Crime",
                    style: TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ),
              ],
            ),
          ),

          const Icon(Icons.chevron_right, color: Colors.white38),
        ],
      ),
    );
  }
}
