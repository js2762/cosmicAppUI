part of 'favourite_bloc.dart';

abstract class FavouriteEvent{}

class FavouriteListEvent extends FavouriteEvent{
  final Planet planetData;
  FavouriteListEvent(this.planetData);
}