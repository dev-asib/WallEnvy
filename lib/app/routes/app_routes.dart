import 'package:get/get.dart';
import 'package:wall_envy/app/routes/routes_name.dart';
import 'package:wall_envy/presentation/ui/screens/details_screen.dart';
import 'package:wall_envy/presentation/ui/screens/home_screen.dart';
import 'package:wall_envy/presentation/ui/screens/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.homeScreen,
          page: () => const HomeScreen(),
        ),
        GetPage(
          name: RoutesName.detailsScreen,
          page: () => const DetailsScreen(),
        ),
      ];
}
