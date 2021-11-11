import 'package:flutter/material.dart';
import 'package:hq_characters/app/core/values/colors.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
