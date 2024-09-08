import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/app/app_themes.dart';
import 'package:wall_envy/app/routes/app_routes.dart';
import 'package:wall_envy/presentation/bindings/app_bindings.dart';
import 'package:wall_envy/presentation/state_holders/controllers/connectivity_controller.dart';

class WallEnvy extends StatelessWidget {
  const WallEnvy({super.key});

  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.put(ConnectivityController());

    return GetMaterialApp(
      getPages: AppRoutes.appRoutes(),
      initialBinding: AppBindings(),
      theme: AppThemes.buildThemeData(),
    );
  }
}
