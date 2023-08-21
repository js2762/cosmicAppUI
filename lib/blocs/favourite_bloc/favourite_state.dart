part of 'favourite_bloc.dart';

abstract class FavouriteState {}

class FavouriteLoadingState extends FavouriteState {

}

class FavouriteListState extends FavouriteState{
  final List<Planet> favouritePlanetList;
  FavouriteListState(this.favouritePlanetList);

}