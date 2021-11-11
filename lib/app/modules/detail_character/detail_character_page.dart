import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/core/values/colors.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_controller.dart';

class DetailCharacterPage extends GetView<DetailCharacterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: AppColors.foregroundColor.withOpacity(0.8),
        backgroundColor: Get.arguments.cor_dominante!.dominantColor!.color,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            // color: AppColors.foregroundColor.withOpacity(0.8),
            color: Get.arguments.cor_dominante!.dominantColor!.color,
          ),
          Positioned(
            left: 100,
            child: Container(
              width: 200,
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: Get.arguments.name,
                  child: Image.network(
                    Get.arguments.thumbnail_big,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  stops: [0.7, 0.7, 5],
                  colors: [
                    AppColors.backgroundColor,
                    AppColors.backgroundColor,
                    Colors.transparent
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 150, left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.arguments.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 150,
                      child: SingleChildScrollView(
                        child: Text(
                          Get.arguments.description == ''
                              ? 'Sem descrição'
                              : Get.arguments.description,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 2),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Comics',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w300,
                          letterSpacing: 2),
                    ),
                    Container(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: (Get.arguments.comics as List<String>)
                            .map((comic) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      // color: AppColors.foregroundColor,
                                      color: Get.arguments.cor_dominante!
                                          .dominantColor!.color,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Text(
                                        comic,
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
