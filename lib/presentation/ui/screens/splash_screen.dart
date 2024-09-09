import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wall_envy/app/routes/routes_name.dart';
import 'package:wall_envy/presentation/state_holders/controllers/connectivity_controller.dart';
import 'package:wall_envy/presentation/ui/utils/app_string.dart';
import 'package:wall_envy/presentation/ui/widgets/splash/splash_logo_widget.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void _moveToNextScreen() {
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAndToNamed(
        RoutesName.homeScreen,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  @override
  Widget build(BuildContext context) {
    final ConnectivityController connectivityController = Get.find();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const SplashLogoWidget(),
            const SizedBox(height: 8),
            Text(
              AppString.appName,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(),
            const Spacer(),
            Text(
              "Version 1.0.0",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
