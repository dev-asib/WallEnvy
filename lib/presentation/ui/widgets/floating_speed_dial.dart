import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:simple_speed_dial/simple_speed_dial.dart';
import 'package:wall_envy/presentation/state_holders/controllers/details_screen_controller.dart';

class FloatingSpeedDial extends StatelessWidget {
  const FloatingSpeedDial({
    super.key,
    required this.wallpaperUrl,
  });

  final String wallpaperUrl;

  @override
  Widget build(BuildContext context) {
    final DetailsScreenController detailsScreenController =
    Get.put(DetailsScreenController());
    return SpeedDial(
      openBackgroundColor: Colors.deepPurple,
      closedBackgroundColor: Colors.deepPurple,
      openForegroundColor: Colors.white,
      closedForegroundColor: Colors.white,
      labelsBackgroundColor: Colors.deepPurple,
      labelsStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      speedDialChildren: <SpeedDialChild>[
        buildSpeedDialChild(
          icon: Icons.share,
          labelText: "Share",
          onTap:()=> detailsScreenController.shareWallpaper(wallpaperUrl),
        ),
        buildSpeedDialChild(
          icon: Icons.download,
          labelText: "Download",
          onTap:()=> detailsScreenController.downloadWallpaper(wallpaperUrl),
        ),
        buildSpeedDialChild(
          icon: Icons.home,
          labelText: "Set Home",
          onTap: ()=> detailsScreenController.setWallPaperHomeScreen(wallpaperUrl),
        ),
        buildSpeedDialChild(
          icon: Icons.lock,
          labelText: "Lock Screen",
          onTap:()=> detailsScreenController.setWallPaperLockScreen(wallpaperUrl),
        ),
      ],
      child: const Icon(
        Icons.add_outlined,
        size: 40,
      ),
    );
  }

  SpeedDialChild buildSpeedDialChild({
    required IconData icon,
    required String labelText,
    required VoidCallback onTap,
  }) {
    return SpeedDialChild(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepPurple,
      child: Icon(icon),
      label: labelText,
      onPressed: onTap,
      closeSpeedDialOnPressed: false,
    );
  }
}
