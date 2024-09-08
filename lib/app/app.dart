import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:wall_envy/app/app_themes.dart';
import 'package:wall_envy/app/routes/app_routes.dart';
import 'package:wall_envy/presentation/bindings/app_bindings.dart';

class WallEnvy extends StatelessWidget {
  const WallEnvy({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppRoutes.appRoutes(),
      initialBinding: AppBindings(),
      theme: AppThemes.buildThemeData(),
    );
  }
}
