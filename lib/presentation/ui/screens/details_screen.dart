import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/presentation/ui/widgets/floating_speed_dial.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, String>? arguments = Get.arguments as Map<String, String>?;
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
            child: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(wallpaperUrl),
                  fit: BoxFit.fill,
                  onError: (_, __) => const Icon(Icons.error),
                ),
              ),
            ),
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
