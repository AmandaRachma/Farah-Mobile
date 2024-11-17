import 'package:audio/app/modules/Scanner/controllers/scanner_controller.dart';
import 'package:get/get.dart';

class ScannerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScannerController>(() => ScannerController());
  }
}