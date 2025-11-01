import 'package:flutter/material.dart';
import 'package:movie_app_test/core/util/assets_manager.dart';
import 'package:movie_app_test/core/util/style.dart';
import 'package:movie_app_test/core/widget/app_cahed_network_image.dart';
import 'package:movie_app_test/features/home/doman/entities/movie_entity.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieEntity movieEntity;
  const MovieDetailsScreen({super.key, required this.movieEntity});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppCahedNetworkImage(
                  fit: BoxFit.cover,
                  image: movieEntity.posterPath ?? AssetsManager.imageNotFound,

                  placeholder: const Icon(
                    Icons.image_rounded,
                    color: Colors.white38,
                    size: 28,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Text(
              movieEntity.title ?? 'The Matrix',
              style: TextStyles.font16SemiBold.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  "${movieEntity.popularity?.toInt().toString()}/10",
                  style: TextStyles.font14GrayRegular,
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Sci-Fi',
                    style: TextStyles.font16SemiBold.copyWith(fontSize: 14),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            Text('Description', style: TextStyles.font16SemiBold),
            const SizedBox(height: 8),

            Text(
              movieEntity.overview ??
                  'A computer programmer discovers that reality as he knows it is a simulation created by machines.',
              style: TextStyles.font14GrayRegular,
            ),
          ],
        ),
      ),
    );
  }
}
