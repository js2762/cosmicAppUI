import 'package:cosmic/resources/app_images.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/planet.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final List<Planet> planetList = [
    Planet(
      id: 1,
      isFavourite: false,
      name: 'Mercury',
      imagePath: AppImages.mercury,
      distance: 68.001,
      gravity: 3.7,
      hours: 1408,
      mass: 0.33,
      temp: 167,
      velocity: 4.3,
      information:
          'Mercury is the first planet from the Sun and the smallest planet in the Solar System. It is a terrestrial planet with a heavily cratered surface due to the planet having no geological activity and an extremely tenuous atmosphere.',
      environmentInfo:
          "Mercury possesses a thin exosphere made up of atoms blasted off the surface by the solar wind and striking meteoroids. Mercury's exosphere is composed mostly of oxygen, sodium, hydrogen, helium, and potassium.",
    ),
    Planet(
      id: 2,
      isFavourite: false,
      name: 'Venus',
      imagePath: AppImages.venus,
      information:
          "Venus is the second planet from the Sun. It is a rocky planet with the densest atmosphere of all the rocky bodies in the Solar System, and the only one with a mass and size that is close to that of its orbital neighbour Earth.",
      environmentInfo:
          "Venus has a thick, toxic atmosphere filled with carbon dioxide and it's perpetually shrouded in thick, yellowish clouds of sulfuric acid that trap heat, causing a runaway greenhouse effect.",
      velocity: 10.36,
      temp: 464,
      mass: 4.867,
      hours: 5832,
      gravity: 8.87,
      distance: 108.93,
    ),
    Planet(
      id: 3,
      isFavourite: false,
      name: 'Earth',
      imagePath: AppImages.earth,
      information:
          "Earth is the third planet from the Sun and the only astronomical object known where life developed and found habitability. This is enabled by Earth being a water world, the only one in the Solar System sustaining liquid surface water.",
      environmentInfo:
          "The environment refers to the surroundings in which life exists on earth. Components like animals, humans, sunlight, water, trees, and air make up the environment. They are the earth's living and non-living components. Living organisms include trees, humans, and animals.",
      velocity: 11.2,
      temp: 15,
      mass: 5.97,
      hours: 24,
      gravity: 9.8,
      distance: 151.84,
    ),
    Planet(
      id: 4,
      isFavourite: false,
      name: 'Mars',
      imagePath: AppImages.mars,
      information:
          "Mars is the fourth planet and the furthest terrestrial planet from the Sun. The reddish color of its surface is due to finely grained iron(III) oxide dust in the soil, giving it the nickname 'the Red Planet'. Mars's radius is second smallest among the planets in the Solar System at 3,389.5 km.",
      environmentInfo:
          "The atmosphere of Mars is the layer of gases surrounding Mars. It is primarily composed of carbon dioxide, molecular nitrogen, and argon. It also contains trace levels of water vapor, oxygen, carbon monoxide, hydrogen, and noble gases. The atmosphere of Mars is much thinner than Earth's",
      velocity: 5.03,
      temp: -63,
      mass: 0.642,
      hours: 24.5,
      gravity: 3.71,
      distance: 247.83,
    ),
    Planet(
      id: 5,
      isFavourite: false,
      name: 'Jupiter',
      imagePath: AppImages.jupiter,
      information:
          "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun.",
      environmentInfo:
          "The composition of Jupiter is similar to that of the Sun – mostly hydrogen and helium. Deep in the atmosphere, pressure and temperature increase, compressing the hydrogen gas into a liquid. This gives Jupiter the largest ocean in the solar system – an ocean made of hydrogen instead of water.",
      velocity: 59.5,
      temp: -234,
      mass: 1898.13,
      hours: 10,
      gravity: 24.79,
      distance: 778.5,
    ),
  ];

  HomeBloc() : super(HomeStateLoading()) {

    on<UpdatedDataEvent>((event, emit) {
      emit(UpdatedDataState(planetList));
    });

    on<UpdateFavouriteStatusEvent>((event, emit) {
      event.planetData.isFavourite = !(event.planetData.isFavourite);
      final index = planetList.indexWhere((element) => element.id == event.planetData.id);
      planetList[index] = event.planetData;
      emit(UpdatedDataState(planetList));
    });

    // on<DemoEvent>((event, emit) {
    //   emit(HomeStateLoading());
    // });


    // on<NavigationBarEvent>(
    //   (event, emit) {
    //     emit(NavigationBarState(event.selectedIndex));
    //   },
    // );
    // on<FavouriteStatusEvent>(
    //   (event, emit) {
    //     final resultPlanetData =
    //         planetList.firstWhere((element) => element.id == event.planetId);
    //     resultPlanetData.isFavourite = !(resultPlanetData.isFavourite);
    //     int index =
    //         planetList.indexWhere((element) => element.id == event.planetId);
    //     planetList[index] = resultPlanetData;
    //     //emit(FavouriteStatusState(resultPlanetData));
    //   },
    // );
  }
}
