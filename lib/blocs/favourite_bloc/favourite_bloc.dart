import 'package:cosmic/models/planet.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  final List<Planet> favouritePlanetList = [];

  FavouriteBloc() : super(FavouriteLoadingState()) {
    on<FavouriteListEvent>((event, emit) {
      bool isExist = false;
      for (var i = 0; i < favouritePlanetList.length; i++) {
        if (favouritePlanetList[i].name == event.planetData.name) {
          favouritePlanetList.removeAt(i);
          isExist = true;
          break;
        }
      }
      if (!isExist) {
        favouritePlanetList.add(event.planetData);
      }
      emit(FavouriteListState(favouritePlanetList));
    });
  }
}
