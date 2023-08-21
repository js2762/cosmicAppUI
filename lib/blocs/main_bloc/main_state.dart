part of 'main_bloc.dart';

abstract class MainState {}

class MainLoadingState extends MainState {}

class NavigationBarState extends MainState {
  final int selectedIndex;

  NavigationBarState(this.selectedIndex);
}
