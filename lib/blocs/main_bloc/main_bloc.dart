import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';
part 'main_event.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainLoadingState()) {
    on<NavigationBarEvent>(
      (event, emit) {
        emit(NavigationBarState(event.selectedIndex));
      },
    );
  }
}
