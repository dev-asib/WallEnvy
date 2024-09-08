import 'package:flutter/material.dart';
import 'package:wall_envy/presentation/ui/utils/assets_path.dart';

class SplashLogoWidget extends StatelessWidget {
  const SplashLogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 180,
        height: 180,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsPath.appLogo),
          ),
        ),
      ),
    );
  }
}
