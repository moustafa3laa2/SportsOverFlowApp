import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/cubits/GetLeaguesCubit/get_leagues_cubit.dart';
import 'package:sports_app_green_eagles/screens/countries_screen.dart';

void main() {
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
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF38003C)),
          useMaterial3: true,
        ),
        home: const CountriesScreen(),
      ),
    );
  }
}
