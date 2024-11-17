import 'package:audio/app/modules/Rate/views/rate_view.dart';
import 'package:audio/app/modules/Scanner/bindings/scanner_binding.dart';
import 'package:get/get.dart';

import '../modules/Audio/bindings/audio_binding.dart';
import '../modules/Audio/views/audio_view.dart';
import '../modules/Rate/bindings/rate_bindings.dart';
import '../modules/Scanner/views/scanner_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.RATE;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.AUDIO,
      page: () => const AudioView(),
      binding: AudioBinding(),
    ),
    GetPage(
      name: Routes.SCANNER,
      page: () => ScannerView(),
      binding: ScannerBinding(),
    ),
    GetPage(
      name: Routes.RATE,
      page: () => const RateView(),
      binding: RateBinding(),
    ),
  ];
}
