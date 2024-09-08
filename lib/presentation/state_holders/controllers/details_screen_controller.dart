import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wall_envy/presentation/ui/widgets/toast_message.dart';

class DetailsScreenController extends GetxController {

  shareWallpaper(wallpaperUrl) {
    Share.share(wallpaperUrl);
  }

  downloadWallpaper(wallpaperUrl) async {
    try {
      await FileDownloader.downloadFile(
        url: wallpaperUrl,
        onDownloadCompleted: (value) {
          toastMessage("Wallpaper Download Success.\npath: $value");
          update();
        },
        onDownloadError: (value) {
          toastMessage("Something is wrong.");

        },
      );
    } catch (e) {
      debugPrint("Download Error: $e");
      toastMessage("Download Failed.");
    }
  }

  setWallPaperHomeScreen(wallpaperUrl) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(wallpaperUrl);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      toastMessage("Set Successfully");
    } catch (e) {
      toastMessage("Failed");
    }
  }

  setWallPaperLockScreen(wallpaperUrl) async {
    try {
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(wallpaperUrl);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      toastMessage("Set Successfully");
    } catch (e) {
      toastMessage("Failed");
    }
  }
}
