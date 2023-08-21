import 'package:cosmic/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:cosmic/blocs/home_bloc/home_bloc.dart';
import 'package:cosmic/models/planet.dart';
import 'package:cosmic/resources/app_colors.dart';
import 'package:cosmic/resources/app_images.dart';
import 'package:cosmic/resources/global_widgets.dart';
import 'package:cosmic/screens/infoscreen/info_screen_view.dart';
import 'package:cosmic/screens/profilescreen/profile_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritePageView extends StatelessWidget {
  const FavouritePageView({super.key});

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
                const Text(
                  'Favourites',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
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
          BlocBuilder<FavouriteBloc, FavouriteState>(
            builder: (context, state) {
              if (state is HomeStateLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is FavouriteListState) {
                return state.favouritePlanetList.isEmpty
                    ? const Expanded(
                      child:  Center(
                        child: Text(
                            'Add to Favourite',
                            style: TextStyle(color: Colors.white, fontSize: 26),
                          ),
                      ),
                    )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: state.favouritePlanetList.length,
                          itemBuilder: (context, index) {
                            return favouriteCard(
                                state.favouritePlanetList[index], context);
                          },
                        ),
                      );
              }
              return const Expanded(
                child: Center(
                  child: Text(
                    'Add to Favourite',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget favouriteCard(Planet planetItem, BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 25, left: 25, right: 25),
    padding: const EdgeInsets.all(15),
    height: 180,
    width: double.infinity,
    decoration: BoxDecoration(
      color: AppColors.darkBG,
      borderRadius: BorderRadius.circular(35),
    ),
    child: Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 10),
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
                  child: Column(
                    children: [
                      RichText(
                        maxLines: 6,
                        overflow: TextOverflow.ellipsis,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: '${planetItem.name}\n',
                              style: const TextStyle(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                            const WidgetSpan(
                              child: SizedBox(
                                height: 20,
                              ),
                            ),
                            TextSpan(text: planetItem.information)
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed(InfoScreenView.routeName, arguments: planetItem);
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
        Positioned(
          top: 0,
          right: 2,
          child: InkWell(
            onTap: () {
              BlocProvider.of<HomeBloc>(context)
                  .add(UpdateFavouriteStatusEvent(planetItem));
              BlocProvider.of<FavouriteBloc>(context)
                  .add(FavouriteListEvent(planetItem));

              /// here call infobloc event for removing favourite status and implement logic for that reference cakeblocapp
            },
            child: planetItem.isFavourite
                ? const Icon(
                    Icons.favorite_rounded,
                    size: 25,
                    color: AppColors.accent,
                  )
                : const Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 25,
                  ),
          ),
        ),
      ],
    ),
  );
}
