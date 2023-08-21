import 'package:cosmic/blocs/home_bloc/home_bloc.dart';
import 'package:cosmic/models/planet.dart';
import 'package:cosmic/resources/app_colors.dart';
import 'package:cosmic/resources/app_images.dart';
import 'package:cosmic/resources/global_widgets.dart';
import 'package:cosmic/screens/infoscreen/info_screen_view.dart';
import 'package:cosmic/screens/profilescreen/profile_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageView extends StatelessWidget {
  final TabController tabController;

  const HomePageView({required this.tabController, super.key});

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
      child: Column(
        children: [
          Container(
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GlobalWidgets.customCircleAvatar(
                  Image.asset(AppImages.settingIcon),
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Milky Way\n',
                        style: TextStyle(color: AppColors.greyText),
                      ),
                      TextSpan(
                        text: 'Solar System',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ProfileScreenView.routeName);
                  },
                  child: GlobalWidgets.customCircleAvatar(
                    Image.asset(AppImages.profileIcon),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeStateLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is UpdatedDataState) {
                  return Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TabBar(
                          unselectedLabelColor: AppColors.greyText,
                          labelColor: AppColors.accent,
                          labelStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                          controller: tabController,
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 6),
                          overlayColor:
                              MaterialStateProperty.all(Colors.transparent),
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          isScrollable: true,
                          tabs: [
                            customiseTab(AppImages.mercury,
                                state.updatedPlanetList[0].name.toString()),
                            customiseTab(AppImages.venus,
                                state.updatedPlanetList[1].name.toString()),
                            customiseTab(AppImages.earth,
                                state.updatedPlanetList[2].name.toString()),
                            customiseTab(AppImages.mars,
                                state.updatedPlanetList[3].name.toString()),
                            customiseTab(AppImages.jupiter,
                                state.updatedPlanetList[4].name.toString()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          controller: tabController,
                          children: [
                            customiseTabView(
                                state.updatedPlanetList[0], context),
                            customiseTabView(
                                state.updatedPlanetList[1], context),
                            customiseTabView(
                                state.updatedPlanetList[2], context),
                            customiseTabView(
                                state.updatedPlanetList[3], context),
                            customiseTabView(
                                state.updatedPlanetList[4], context),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const Center(
                  child: Text(
                    'something went wrong in HomePage!',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget customiseTab(
  String imagePath,
  String tabName,
) {
  return Container(
    height: 60,
    padding: const EdgeInsets.all(15),
    decoration: BoxDecoration(
      color: AppColors.darkBG,
      borderRadius: BorderRadius.circular(35),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Image.asset(
            imagePath,
            height: 30,
          ),
        ),
        Tab(text: tabName),
      ],
    ),
  );
}

Widget customiseTabView(
  Planet planetData,
  BuildContext context,
) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkBG,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Planet of the day',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Image.asset(
                      AppImages.mercury,
                      height: 60,
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      maxLines: 6,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${planetData.name}\n',
                            style: const TextStyle(
                              color: AppColors.accent,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const WidgetSpan(
                            child: SizedBox(
                              height: 20,
                            ),
                          ),
                          TextSpan(
                            text: planetData.information,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(InfoScreenView.routeName,
                      arguments: planetData);
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Details',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      Icons.arrow_forward_rounded,
                      color: AppColors.accent,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(15),
          //height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.darkBG,
            borderRadius: BorderRadius.circular(20),
          ),
          child: RichText(
            text: TextSpan(
              children: [
                const TextSpan(
                  text: 'Environment\n\n',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: planetData.environmentInfo,
                )
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
