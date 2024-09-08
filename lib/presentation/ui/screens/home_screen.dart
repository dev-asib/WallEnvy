import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/presentation/state_holders/controllers/home_screen_controller.dart';
import 'package:wall_envy/presentation/ui/widgets/app_bar.dart';
import 'package:wall_envy/presentation/ui/widgets/wallpaper_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("WallEnvy"),
      body: GetBuilder<HomeScreenController>(
        init: HomeScreenController(),
        builder: (homeScreenController) {
          return GridView.builder(
            itemCount: homeScreenController.wallpapers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              return WallpaperCard(
                wallpapers: homeScreenController.wallpapers[index],
              );
            },
          );
        },
      ),
    );
  }
}