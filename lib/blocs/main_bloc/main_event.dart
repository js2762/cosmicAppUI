part of 'main_bloc.dart';

abstract class MainEvent{}

class NavigationBarEvent extends MainEvent {
  final int selectedIndex;
  NavigationBarEvent(this.selectedIndex);
}