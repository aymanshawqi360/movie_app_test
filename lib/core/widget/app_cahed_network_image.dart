import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCahedNetworkImage extends StatelessWidget {
  final String image;
  final double? width;
  final double? height;
  final Widget placeholder;
  final BoxFit? fit;

  const AppCahedNetworkImage({
    super.key,

    required this.image,
    this.width,
    this.fit,
    this.height,
    required this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      height: height,
      width: width,
      fit: fit ?? BoxFit.contain,
      placeholder: (context, url) {
        return placeholder;
      },
      errorWidget: (context, url, error) {
        return const Icon(
          Icons.image_not_supported_outlined,
          color: Colors.white38,
          size: 28,
        );
        // Icon(Icons.error, color: Colors.red);
      },
    );
  }
}
