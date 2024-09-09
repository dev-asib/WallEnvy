import 'package:flutter/material.dart';
import 'package:wall_envy/presentation/ui/utils/app_string.dart';

AppBar buildAppBar() {
  return AppBar(
    title: const Text(AppString.appName),
  );
}
