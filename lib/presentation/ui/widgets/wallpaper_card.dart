import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/app/routes/routes_name.dart';
import 'package:wall_envy/data/entities/wallpapers.dart';

class WallpaperCard extends StatelessWidget {
  const WallpaperCard({
    super.key,
    required this.wallpapers,
  });

  final Wallpapers wallpapers;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTapWallpaper(context),
      child: Hero(
        tag: "tag-${wallpapers.wallpaperID}",
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              image: DecorationImage(
                image: NetworkImage(wallpapers.wallpaperUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ),
    );
  }

  onTapWallpaper(BuildContext context) {
    Get.toNamed(
      RoutesName.detailsScreen,
      arguments: {
        "wallpaperUrl": wallpapers.wallpaperUrl,
        "tag": "tag-${wallpapers.wallpaperID}",
      },
    );
  }
}
