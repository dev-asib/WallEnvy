import 'package:get/get.dart';
import 'package:wall_envy/presentation/state_holders/controllers/details_screen_controller.dart';
import 'package:wall_envy/presentation/state_holders/controllers/home_screen_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => HomeScreenController(),
    );
    Get.lazyPut(
      () => DetailsScreenController(),
    );
  }
}
