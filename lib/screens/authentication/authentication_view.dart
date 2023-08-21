import 'package:cosmic/resources/global_widgets.dart';
import 'package:cosmic/screens/homescreen/main_screen_view.dart';
import 'package:flutter/material.dart';
import '../../resources/app_images.dart';
import '../../resources/app_colors.dart';

class Authentication extends StatelessWidget {
  const Authentication({super.key});

  //final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.backGroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 130),
              child: Image.asset(AppImages.logo),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(35),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: AppColors.darkBG,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: customTextField('abc@gmail.com'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: customTextField('Password'),
                    ),
                    TextButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style:
                            TextStyle(color: AppColors.accent, fontSize: 18),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(MainScreenView.routeName);
                      },
                      child: GlobalWidgets.customGradientButton('Sign in',-1.2),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.greyText,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 5, right: 5, top: 5, bottom: 5),
                            child: const Text(
                              'or sign in using',
                              style: TextStyle(color: AppColors.greyText),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          customCircleAvatar(AppImages.twitterIcon),
                          Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child:
                                  customCircleAvatar(AppImages.facebookIcon)),
                          customCircleAvatar(AppImages.googleIcon),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15,bottom: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(color: AppColors.greyText),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => Colors.transparent),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                  color: AppColors.accent, fontSize: 18),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customTextField(String hintTextInput) {
  return TextField(
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
      fillColor: AppColors.darkBG,
      filled: true,
      hintText: hintTextInput,
      hintStyle: const TextStyle(fontSize: 16, color: Colors.white),
      //focusColor: Colors.white,
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: AppColors.darkStroke, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(color: Colors.white, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(width: 2),
      ),
    ),
  );
}

Widget customCircleAvatar(String assetPath) {
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
    child: Transform.scale(
        scale: 0.6,
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
        )),
  );
}
