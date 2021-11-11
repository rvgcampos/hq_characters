import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/core/values/colors.dart';
import 'package:hq_characters/app/modules/home/components/buscar_mais.dart';
import 'package:hq_characters/app/modules/home/components/card_character.dart';
import 'package:hq_characters/app/modules/home/components/loading.dart';
import 'package:hq_characters/app/modules/home/components/logo.dart';
import 'package:hq_characters/app/modules/home/home_controller.dart';
import 'dart:ui';

import 'package:hq_characters/app/routes/routes.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              controller.characters.clear();
              controller.fetchCharacters();
            },
            icon: Icon(
              Icons.refresh,
              color: AppColors.foregroundColor,
              size: 28,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.filterByComics();
            },
            icon: Icon(
              Icons.filter_list_outlined,
              color: AppColors.foregroundColor,
              size: 28,
            ),
          )
        ],
        title: Logo(),
        backgroundColor: AppColors.backgroundColor,
      ),
      body: Stack(
        children: [
          Container(
            color: Color(0xFF171717),
          ),
          Column(
            children: [
              Expanded(
                child: Obx(
                  () => controller.loading == true
                      ? Loading()
                      : Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: controller.characters.length + 1,
                                itemBuilder: (context, index) {
                                  if (index == controller.characters.length) {
                                    return BuscarMais(controller: controller);
                                  } else {
                                    var character =
                                        controller.characters[index];
                                    return GestureDetector(
                                      onTap: () {
                                        Get.toNamed(Routes.CHARACTER_DETAIL,
                                            arguments: character);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CardCharacter(
                                          character: character,
                                        ),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
