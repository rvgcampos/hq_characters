import 'package:get/get.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_binding.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_page.dart';
import 'package:hq_characters/app/modules/home/home_binding.dart';
import 'package:hq_characters/app/modules/home/home_page.dart';
import 'package:hq_characters/app/modules/splash/splash_binding.dart';
import 'package:hq_characters/app/modules/splash/splash_page.dart';
import 'package:hq_characters/app/routes/routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashPage(),
      binding: SplashBinding()
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.CHARACTER_DETAIL,
      page: () => DetailCharacterPage(),
      binding: DetailCharacterBinding(),
    )
  ];
}
