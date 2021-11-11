import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/data/providers/CharactersProvider.dart';
import 'package:hq_characters/app/data/repository/CharactersRepository.dart';
import 'package:hq_characters/app/modules/home/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HomeController>(
      HomeController(
        repository: CharactersRepository(
          provider: CharactersProvider(
            dio: Dio(),
          ),
        ),
      ),
    );
  }
}
