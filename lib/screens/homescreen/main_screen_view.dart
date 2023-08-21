import 'package:cosmic/blocs/main_bloc/main_bloc.dart';
import 'package:cosmic/resources/app_colors.dart';
import 'package:cosmic/screens/homescreen/favourite_page_view.dart';
import 'package:cosmic/screens/homescreen/home_page_view.dart';
import 'package:cosmic/blocs/home_bloc/home_bloc.dart';
import 'package:cosmic/screens/homescreen/more_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreenView extends StatefulWidget {
  const MainScreenView({super.key});

  static const routeName = '/HomeScreenView';

  @override
  State<MainScreenView> createState() => _MainScreenViewState();
}

class _MainScreenViewState extends State<MainScreenView>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final mainBlocProvider = BlocProvider.of<MainBloc>(context);
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        if (state is HomeStateLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (state is NavigationBarState) {
          return SafeArea(
            child: Scaffold(
              extendBody: true,
              body: IndexedStack(
                index: state.selectedIndex,
                children: [
                  HomePageView(tabController: tabController),
                  const FavouritePageView(),
                  const MorePageView(),
                ],
              ),
              bottomNavigationBar: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                height: 80,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                  child: BottomNavigationBar(
                    currentIndex: state.selectedIndex,
                    onTap: (index) {
                      mainBlocProvider.add(NavigationBarEvent(index));
                    },
                    selectedItemColor: AppColors.accent,
                    unselectedItemColor: AppColors.greyText,
                    backgroundColor: AppColors.darkBG,
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.language_rounded,
                          size: 25,
                        ),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite_border_rounded,
                          size: 25,
                        ),
                        label: 'Favourites',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          size: 25,
                        ),
                        label: 'More',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(
            child: Text('Something went wrong'),
          ),
        );
      },
    );
  }
}


