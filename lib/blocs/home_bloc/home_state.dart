part of 'home_bloc.dart';

abstract class HomeState {}

class HomeStateLoading extends HomeState {}

class UpdatedDataState extends HomeState {
  final List<Planet> updatedPlanetList;

  UpdatedDataState(this.updatedPlanetList);
}

// class NavigationBarState extends HomeState{
//   final int selectedIndex;
//   NavigationBarState(this.selectedIndex);
// }
