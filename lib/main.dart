import 'package:cosmic/blocs/favourite_bloc/favourite_bloc.dart';
import 'package:cosmic/blocs/home_bloc/home_bloc.dart';
import 'package:cosmic/blocs/main_bloc/main_bloc.dart';
import 'package:cosmic/screens/profilescreen/profile_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/authentication/authentication_view.dart';
import 'screens/homescreen/main_screen_view.dart';
import 'screens/infoscreen/info_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainBloc()..add(NavigationBarEvent(0)),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(UpdatedDataEvent()),
        ),
        BlocProvider(
          create: (context) => FavouriteBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cosmic Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Authentication(),
        routes: {
          MainScreenView.routeName: (context) => const MainScreenView(),
          InfoScreenView.routeName: (context) => const InfoScreenView(),
          ProfileScreenView.routeName: (context) => const ProfileScreenView(),
        },
      ),
    );
  }
}

