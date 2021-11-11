import 'package:get/get.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_controller.dart';

class DetailCharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DetailCharacterController>(DetailCharacterController());
  }
}
