import 'package:cosmic/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GlobalWidgets {
  static Widget customCircleAvatar(Widget childWidget) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2,
        ),
      ),
      child: childWidget,
    );
  }

  static Widget customGradientButton(String buttonText,double transformValue){
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 10),
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          transform: GradientRotation(transformValue),
          stops: const [0.35, 0.5, 0.7],
          colors: const [
            AppColors.lg1,
            AppColors.lg3,
            AppColors.lg2,
          ],
        ),
      ),
      child: Text(
        buttonText,
        style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
