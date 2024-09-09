import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/presentation/state_holders/controllers/connectivity_controller.dart';
import 'package:wall_envy/presentation/ui/widgets/cached_network_image_widget.dart';
import 'package:wall_envy/presentation/ui/widgets/floating_speed_dial.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.find();

    final Map<String, String>? arguments =
        Get.arguments as Map<String, String>?;
    final String wallpaperUrl = arguments?['wallpaperUrl'] ?? '';
    final String tag = arguments?['tag'] ?? '';

    if (wallpaperUrl.isEmpty || tag.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Center(
          child: Hero(
            tag: tag,
            child: CachedNetworkImageWidget(wallpaperUrl: wallpaperUrl),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: FloatingSpeedDial(
            wallpaperUrl: wallpaperUrl,
          ),
        ),
      ],
    );
  }
}
