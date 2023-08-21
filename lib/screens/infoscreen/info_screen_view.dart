import 'package:cosmic/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:cosmic/blocs/home_bloc/home_bloc.dart';
import 'package:cosmic/models/planet.dart';
import 'package:cosmic/resources/app_colors.dart';
import 'package:cosmic/resources/app_images.dart';
import 'package:cosmic/resources/global_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoScreenView extends StatefulWidget {
  const InfoScreenView({super.key});

  static const routeName = '/InfoScreenView';

  @override
  State<InfoScreenView> createState() => _InfoScreenViewState();
}

class _InfoScreenViewState extends State<InfoScreenView> {
  @override
  Widget build(BuildContext context) {
    Planet finalPlanetData =
        ModalRoute.of(context)!.settings.arguments as Planet;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.backGroundImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: GlobalWidgets.customCircleAvatar(
                      Image.asset(AppImages.arrowIcon),
                    ),
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      List<Planet> resultData = (state is UpdatedDataState)
                          ? state.updatedPlanetList
                          : [];
                      final int index = resultData.indexWhere(
                          (element) => element.id == finalPlanetData.id);
                      //print(resultData);
                      return GlobalWidgets.customCircleAvatar(
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<HomeBloc>(context).add(
                                UpdateFavouriteStatusEvent(finalPlanetData));
                            BlocProvider.of<FavouriteBloc>(context)
                                .add(FavouriteListEvent(finalPlanetData));
                          },
                          icon: resultData[index].isFavourite
                              ? const Icon(
                                  Icons.favorite_rounded,
                                  color: AppColors.accent,
                                )
                              : const Icon(
                                  Icons.favorite_border_rounded,
                                  color: Colors.white,
                                ),
                        ),
                      );
                    },
                  ),
                  // BlocBuilder<InfoBloc, InfoState>(
                  //   builder: (context, state) {
                  //     if (state is FavouriteStatusState) {
                  //       return GlobalWidgets.customCircleAvatar(
                  //         IconButton(
                  //           onPressed: () {
                  //             BlocProvider.of<InfoBloc>(context).add(
                  //               FavouriteStatusEvent(finalPlanetData),
                  //             );
                  //           },
                  //           icon: (state.updatedPlanetData.id ==
                  //                       finalPlanetData.id &&
                  //                   state.updatedPlanetData.isFavourite == true)
                  //               ? const Icon(
                  //                   Icons.favorite_rounded,
                  //                   color: AppColors.accent,
                  //                 )
                  //               : const Icon(
                  //                   Icons.favorite_border_rounded,
                  //                   color: Colors.white,
                  //                 ),
                  //         ),
                  //       );
                  //     }
                  //     return GlobalWidgets.customCircleAvatar(
                  //       IconButton(
                  //         onPressed: () {
                  //           BlocProvider.of<InfoBloc>(context).add(
                  //             FavouriteStatusEvent(finalPlanetData),
                  //           );
                  //         },
                  //         icon: finalPlanetData.isFavourite
                  //             ? const Icon(
                  //                 Icons.favorite_rounded,
                  //                 color: AppColors.accent,
                  //               )
                  //             : const Icon(
                  //                 Icons.favorite_border_rounded,
                  //                 color: Colors.white,
                  //               ),
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
            Positioned(
              top: 250,
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                padding: const EdgeInsets.only(
                    top: 60, left: 35, right: 35, bottom: 40),
                decoration: const BoxDecoration(
                  color: AppColors.darkBG,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      finalPlanetData.name.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              customDataContainer(
                                imagePath: AppImages.massIcon,
                                text1: 'Mass',
                                text2: '(10^24kg)',
                                text3: finalPlanetData.mass.toString(),
                              ),
                              customDataContainer(
                                imagePath: AppImages.velocityIcon,
                                text1: 'Esc. Velocity',
                                text2: '(km/s)',
                                text3: finalPlanetData.velocity.toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              customDataContainer(
                                imagePath: AppImages.gravityIcon,
                                text1: 'Gravity',
                                text2: '(m/s2)',
                                text3: finalPlanetData.gravity.toString(),
                              ),
                              customDataContainer(
                                imagePath: AppImages.tempIcon,
                                text1: 'Mean',
                                text2: 'Temp(C)',
                                text3: finalPlanetData.temp.toString(),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              customDataContainer(
                                imagePath: AppImages.dayIcon,
                                text1: 'Day',
                                text2: '(hours)',
                                text3: finalPlanetData.hours.toString(),
                              ),
                              customDataContainer(
                                imagePath: AppImages.distanceIcon,
                                text1: 'Distance from',
                                text2: 'Sun(million km)',
                                text3: finalPlanetData.distance.toString(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 150,
                      child: GlobalWidgets.customGradientButton('Visit', -0.95),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              left: 0,
              right: 0,
              child: Image.asset(
                finalPlanetData.imagePath.toString(),
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget customDataContainer({
  required String imagePath,
  required String text1,
  required String text2,
  required String text3,
}) {
  return Container(
    margin: const EdgeInsets.only(bottom: 30),
    child: Column(
      children: [
        Transform.scale(scale: 1.2, child: Image.asset(imagePath)),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            text1,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Text(
          text2,
          style: const TextStyle(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            text3,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ],
    ),
  );
}
