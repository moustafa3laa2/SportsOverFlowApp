import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetLeaguesCubit/get_leagues_cubit.dart';
import 'package:sports_app_green_eagles/widgets/drawer.dart';
import 'package:sports_app_green_eagles/widgets/leagues_container.dart';
import 'package:sports_app_green_eagles/widgets/top_bar.dart';

class LeaguesScreen extends StatelessWidget {
  const LeaguesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: DrawerApp(),
      appBar: AppBar(leading: BackButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF38003C),
        title: Text('LEAGUES',style: TextStyle(fontSize: 25,
                  fontFamily: 'SofiaProBold',
                  color: Color(0xFFFFFFFF),),),),
      body: BlocBuilder<GetLeaguesCubit, GetLeaguesState>(
        builder: (context, state) {
          try {
            if (state is GetLeaguesLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is GetLeaguesSuccess) {
              return ListView.builder(
                itemCount: state.response.result.length,
                itemBuilder: (context, index) {
                  return LeaguesContainer(index: index);
                },
              );
            } else {
              return const Center(child: Text("Something went wrong!!"));
            }
          } catch (error) {
            return const Center(child: Text("Something went wrong!!"));
          }
        },
      ),
    );
  }
}
