import 'package:flutter/material.dart';
import 'package:hq_characters/app/core/values/colors.dart';

class Loading extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}