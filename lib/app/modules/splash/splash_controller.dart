import 'package:get/get.dart';
import 'package:hq_characters/app/routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    pularPagina();
  }

  pularPagina() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(Routes.HOME);
  }
}
