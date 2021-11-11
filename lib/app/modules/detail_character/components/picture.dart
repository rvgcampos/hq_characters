import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Picture extends StatelessWidget {
  const Picture({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
