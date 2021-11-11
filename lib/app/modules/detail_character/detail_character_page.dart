import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hq_characters/app/core/values/colors.dart';
import 'package:hq_characters/app/modules/detail_character/components/comics.dart';
import 'package:hq_characters/app/modules/detail_character/components/picture.dart';
import 'package:hq_characters/app/modules/detail_character/detail_character_controller.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailCharacterPage extends GetView<DetailCharacterController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.arguments.cor_dominante!.dominantColor!.color,
        elevation: 0,
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: Get.arguments.cor_dominante!.dominantColor!.color,
          ),
          Positioned(
            left: 100,
            child: Picture(),
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
                padding: const EdgeInsets.only(top: 100, left: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          print(Get.arguments.url);
                          await launch(Get.arguments.url);
                        },
                        child: Container(
                          width: 150,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text('Ver mais detalhes'),
                              Icon(Icons.arrow_forward_outlined),
                            ],
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          primary:
                              Get.arguments.cor_dominante!.dominantColor!.color,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
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
                      Comics()
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
