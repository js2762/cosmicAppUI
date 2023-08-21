import 'package:cosmic/resources/app_colors.dart';
import 'package:cosmic/resources/app_images.dart';
import 'package:cosmic/resources/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ProfileScreenView extends StatefulWidget {
  const ProfileScreenView({super.key});

  static const routeName = '/ProfileScreenView';

  @override
  State<ProfileScreenView> createState() => _ProfileScreenViewState();
}

class _ProfileScreenViewState extends State<ProfileScreenView> {
  bool switchValue = false;
  bool checkBoxValue1 = false;
  bool checkBoxValue2 = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppImages.backGroundImage),
              fit: BoxFit.cover,
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.darkBG,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.5),
                          width: 3,
                        ),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                      ),
                      child: const Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: GlobalWidgets.customCircleAvatar(
                          Image.asset(AppImages.arrowIcon),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.all(25),
                  padding: const EdgeInsets.all(15),
                  height: 130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.darkBG,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: Image.asset(AppImages.flyingUserIcon),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: const TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Jaimin Sarvaiya\n',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  WidgetSpan(
                                    child: SizedBox(
                                      height: 25,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'Space adventurer',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Positioned(
                        top: 5,
                        right: 5,
                        child: Image.asset(AppImages.editIcon),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 25, right: 25, bottom: 25),
                  padding: const EdgeInsets.all(15),
                  height: switchValue ? 500 : 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.darkBG,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Transform.scale(
                            scale: 1.1,
                            child: Switch(
                              value: switchValue,
                              onChanged: (value) {
                                setState(
                                  () {
                                    switchValue = value;
                                  },
                                );
                              },
                              activeTrackColor: AppColors.accent,
                              activeColor: AppColors.darkBG2,
                              inactiveTrackColor: AppColors.greyText,
                              inactiveThumbColor: AppColors.darkBG2,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Show planetary progress',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      switchValue
                          ? Padding(
                              padding: const EdgeInsets.all(25),
                              child: Center(
                                child: CircularPercentIndicator(
                                  radius: 130,
                                  animation: true,
                                  animationDuration: 1200,
                                  percent: 0.7,
                                  circularStrokeCap: CircularStrokeCap.round,
                                  lineWidth: 15,
                                  backgroundColor: Colors.white,
                                  linearGradient: const LinearGradient(
                                    colors: [
                                      AppColors.lg1,
                                      AppColors.lg2,
                                      AppColors.lg3,
                                    ],
                                  ),
                                  //progressColor: Colors.green,
                                  center: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(bottom: 10),
                                        child: Text(
                                          'Personal\nprogress',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      checkBoxValue1
                                          ? const Text(
                                              '70.0%',
                                              style: TextStyle(
                                                color: Colors.cyanAccent,
                                                fontSize: 45,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          : const SizedBox.shrink(),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      switchValue
                          ? Row(
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    activeColor: Colors.black,
                                    checkColor: AppColors.accent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 1.5,
                                          color: AppColors.darkStroke),
                                    ),
                                    value: checkBoxValue1,
                                    onChanged: (value) {
                                      setState(() {
                                        checkBoxValue1 = value as bool;
                                      });
                                    },
                                  ),
                                ),
                                const Text(
                                  'Show me in Planet Rating',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                      switchValue
                          ? Row(
                              children: [
                                Transform.scale(
                                  scale: 1.1,
                                  child: Checkbox(
                                    activeColor: Colors.black,
                                    checkColor: AppColors.accent,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2.0),
                                    ),
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => const BorderSide(
                                          width: 1.5,
                                          color: AppColors.darkStroke),
                                    ),
                                    value: checkBoxValue2,
                                    onChanged: (value) {
                                      setState(() {
                                        checkBoxValue2 = value as bool;
                                      });
                                    },
                                  ),
                                ),
                                const Text(
                                  'Notification',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ],
                            )
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
