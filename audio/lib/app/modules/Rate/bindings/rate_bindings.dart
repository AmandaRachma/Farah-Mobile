import 'package:get/get.dart';
import 'package:audio/app/modules/Rate/controllers/rate_controllers.dart';


class RateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RateController());
  }
}