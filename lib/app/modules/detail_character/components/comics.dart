import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Comics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      color: Get.arguments.cor_dominante!.dominantColor!.color,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        comic,
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}