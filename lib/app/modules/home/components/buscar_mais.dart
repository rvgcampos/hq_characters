import 'package:flutter/material.dart';
import 'package:hq_characters/app/core/values/colors.dart';
import 'package:hq_characters/app/modules/home/home_controller.dart';

class BuscarMais extends StatelessWidget {
  HomeController controller;
  BuscarMais({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8),
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: AppColors.foregroundColor.withOpacity(0.8),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Buscar Mais',
                style: TextStyle(color: Colors.white, fontSize: 25),
              )
            ],
          ),
        ),
        onTap: () {
          controller.adicionarMais(page: ++controller.page);
        },
      ),
    );
  }
}
