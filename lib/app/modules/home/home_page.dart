import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/core/values/colors.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_page.dart';
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
        title: Row(
          children: [
            Text(
              'Characters',
              style: TextStyle(
                fontSize: 22,
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                  color: AppColors.foregroundColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              child: Center(
                child: Text(
                  'MARVEL',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.backgroundColor,
                  ),
                ),
              ),
            )
          ],
        ),
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
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircularProgressIndicator(
                                    color: AppColors.foregroundColor,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      : ListView.builder(
                          itemCount: controller.characters.length,
                          itemBuilder: (context, index) {
                            var character = controller.characters[index];
                            return GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.CHARACTER_DETAIL,
                                    arguments: character);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    color: character.cor_dominante!.dominantColor!.color
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white.withOpacity(0.3),
                                        blurRadius: 5,
                                        spreadRadius: 1,
                                      )
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Hero(
                                          tag: character.name!,
                                          child: Image.network(
                                            character.thumbnail!,
                                            height: 80,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          height: double.infinity,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                character.name!,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 26,
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '${character.comics!.length} comics',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
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
