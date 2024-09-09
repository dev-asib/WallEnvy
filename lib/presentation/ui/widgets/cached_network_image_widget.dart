import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    super.key,
    required this.wallpaperUrl,
  });

  final String wallpaperUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: wallpaperUrl,
      fit: BoxFit.fill,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) {
        debugPrint("Error Loading Image: $error");
        return const Center(
          child: Icon(Icons.error),
        );
      },
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
