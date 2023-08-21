import 'package:cosmic/resources/app_images.dart';
import 'package:flutter/material.dart';

class MorePageView extends StatelessWidget {
  const MorePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.backGroundImage),
          fit: BoxFit.cover,
        ),
      ),
      child: const Center(
        child: Text(
          'more info coming soon...',
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
