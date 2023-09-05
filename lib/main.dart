import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/data/cubits/GetLeaguesCubit/get_leagues_cubit.dart';
import 'package:sports_app_green_eagles/data/cubits/GetPlayerCubit/get_player_cubit.dart';
import 'package:sports_app_green_eagles/data/cubits/GetTeamsCubit/get_teams_cubit.dart';
import 'package:sports_app_green_eagles/screens/Homepage.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
import 'package:sports_app_green_eagles/screens/countries_screen.dart';
import 'package:sports_app_green_eagles/screens/login_screen.dart';
import 'package:sports_app_green_eagles/screens/onBoarding.dart';
import 'package:sports_app_green_eagles/screens/players.dart';
import 'package:sports_app_green_eagles/screens/splash.dart';
import 'package:sports_app_green_eagles/screens/teams_top_scorers.dart';
import 'package:sports_app_green_eagles/screens/players.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetLeaguesCubit>(
          create: (BuildContext context) => GetLeaguesCubit(),
        ),
        BlocProvider<GetCountriesCubit>(
          create: (BuildContext context) => GetCountriesCubit(),
        ),
        BlocProvider<GetTeamsCubit>(
          create: (BuildContext context) => GetTeamsCubit(),
        ),
         BlocProvider<GetplayerCubit>(
          create: (BuildContext context) => GetplayerCubit(),
        ),
      
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF38003C)),
          useMaterial3: true,
        ),
        home:  splash(),
      ),
    );
  }
}
