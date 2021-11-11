import 'package:flutter/material.dart';
import 'package:hq_characters/app/data/models/Character.dart';
import 'package:hq_characters/app/modules/home/home_controller.dart';

class CardCharacter extends StatelessWidget {
  Character character;
  CardCharacter({required this.character});
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: character.cor_dominante!.dominantColor!.color.withOpacity(0.5),
        // color: AppColors.foregroundColor.withOpacity(0.8),

        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // color: Colors.white.withOpacity(0.3),
            color:
                character.cor_dominante!.dominantColor!.color.withOpacity(0.7),
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
