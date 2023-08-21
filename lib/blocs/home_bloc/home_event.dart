part of 'home_bloc.dart';

abstract class HomeEvent{}

class UpdatedDataEvent extends HomeEvent{}

class UpdateFavouriteStatusEvent extends HomeEvent{
  final Planet planetData;
  UpdateFavouriteStatusEvent(this.planetData);
}

class DemoEvent extends HomeEvent{}



// class NavigationBarEvent extends HomeEvent{
//   final int selectedIndex;
//   NavigationBarEvent(this.selectedIndex);
// }

