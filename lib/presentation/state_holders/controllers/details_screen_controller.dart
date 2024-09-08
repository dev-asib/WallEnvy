import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:wall_envy/presentation/ui/widgets/toast_message.dart';

class DetailsScreenController extends GetxController {
  RxDouble progress = 0.0.obs;

  void shareWallpaper(String wallpaperUrl) {
    try {
      Share.share(wallpaperUrl);
    } catch (e) {
      debugPrint("Share Error: $e");
      toastMessage("Failed to share wallpaper.");
    }
  }

  Future<void> downloadWallpaper(String wallpaperUrl) async {
    try {
      await FileDownloader.downloadFile(
        url: wallpaperUrl,
        onProgress: (name, progress) {
          debugPrint("Name: $name");
          this.progress.value = progress;
          debugPrint("Download Progress: $progress");
        },
        onDownloadCompleted: (path) {
          toastMessage("Wallpaper Download Success.\npath: $path");
          progress.value = 0.0;
        },
        onDownloadError: (error) {
          debugPrint("Download Error: $error");
          progress.value = 0.0;
          toastMessage("Download failed. Please try again.");
        },
      );
    } catch (e) {
      debugPrint("Download Error: $e");
      toastMessage("Download Failed. An excepted error occurred.");
      progress.value = 0.0;
    }
  }

  Future<void> setWallPaperHomeScreen(String wallpaperUrl) async {
    try {
      int location = WallpaperManager.HOME_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(wallpaperUrl);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      toastMessage("Wallpaper set successfully on home screen.");
    } catch (e) {
      debugPrint("Set Wallpaper Home Screen Error: $e");
      toastMessage("Failed to set wallpaper on home screen.");
    }
  }

  Future<void> setWallPaperLockScreen(String wallpaperUrl) async {
    try {
      int location = WallpaperManager.LOCK_SCREEN;
      var file = await DefaultCacheManager().getSingleFile(wallpaperUrl);
      await WallpaperManager.setWallpaperFromFile(file.path, location);
      toastMessage("Wallpaper set successfully on lock screen.");
    } catch (e) {
      debugPrint("Set Wallpaper Lock Screen Error: $e");
      toastMessage("Failed to set wallpaper on lock screen.");
    }
  }
}
