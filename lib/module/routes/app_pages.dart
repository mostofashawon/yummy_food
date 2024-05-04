import 'package:get/get_navigation/src/routes/get_route.dart';

import '../base/bindings/base_binding.dart';
import '../base/view/base_view.dart';
import '../home/bindings/home_binding.dart';
import '../home/view/home_view.dart';
import '../splash_screen/bindings/splash_screen_binding.dart';
import '../splash_screen/view/splash_screen_view.dart';


part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.BASE,
      page: () =>  BaseView(),
      binding: BaseBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
  ];
}