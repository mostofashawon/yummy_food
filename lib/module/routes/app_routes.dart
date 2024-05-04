
part of 'app_pages.dart';
abstract class Routes {
  Routes._();
  static const HOME = _Paths.HOME;
  static const BASE = _Paths.BASE;
  static const SPLASH_SCREEN = _Paths.SPLASH_SCREEN;

}

abstract class _Paths {
  _Paths._();
  static const HOME = '/home';
  static const BASE = '/base';
  static const SPLASH_SCREEN = '/splash-screen';

}