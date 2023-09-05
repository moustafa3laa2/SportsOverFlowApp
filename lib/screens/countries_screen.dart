import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app_green_eagles/data/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/widgets/countries_container.dart';
import 'package:sports_app_green_eagles/widgets/drawer.dart';
import 'package:sports_app_green_eagles/widgets/top_bar.dart';

class CountriesScreen extends StatefulWidget {
   CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  int index = 0;

  final items = <Widget>[
     const Icon(
      Icons.flag_circle,color: Colors.white,
      size: 30,
    ),

    const Icon(
      Icons.newspaper,color: Colors.white,
      size: 30,
    ),
   
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      endDrawer: DrawerApp(),
      appBar: 
      AppBar(
          backgroundColor: const Color(0xFF38003C),
          leading: const BackButton(
            color: Colors.white,
          ),
          title: BlocBuilder<GetCountriesCubit, GetCountriesState>(
            builder: (context, state) {
              if (state is GetCountriesInitial) {
                return const Text('');
              } else if (state is GetNewsLoading || state is GetNewsSuccess) {
                return const Text(
                  'LATEST NEWS',
                  style: TextStyle(
                      fontFamily: "SofiaPro",
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                );
              } else if (state is GetCountriesLoading ||
                  state is GetCountriesSuccess) {
                return const Text(
                  'COUNTRIES',
                  style: TextStyle(
                      fontFamily: "SofiaPro",
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                );
              } else {
                return const Text(
                  'ERROR',
                  style: TextStyle(
                      fontFamily: "SofiaPro",
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                );
              }
            },
          )),

      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xFF38003C),
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        height: 48,
        items: items,
        onTap: (index) {
          index == 0
              ? context.read<GetCountriesCubit>().getCountries()
              : context.read<GetCountriesCubit>().getNews();
        },
      ),
      
      body: BlocBuilder<GetCountriesCubit, GetCountriesState>(
        builder: (context, state) {
          try {
            if (state is GetCountriesInitial) {
              return const Center(
                  child: Text(
                'latest News | Countries',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xFF38003C),
                    fontFamily: 'SofiaPro',
                    fontWeight: FontWeight.bold),
              ));
            } else if (state is GetCountriesLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is GetCountriesSuccess) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: GridView.builder(
                  itemCount: state.response.result.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return CountriesContainer(index: index);
                  },
                ),
              );
            } else if (state is GetNewsLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is GetNewsSuccess) {
              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int i = 0; i < state.response.articles.length; i++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.3,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8.0)),
                              image: DecorationImage(
                                image: NetworkImage(
                                  state.response.articles[i].urlToImage ??
                                      "images/person1.png",
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  right:
                                      MediaQuery.of(context).size.width * 0.62,
                                  child: Text(
                                    "${state.response.articles[i].author}",
                                    style: GoogleFonts.nunito(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w800,
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.119,
                                  right:
                                      MediaQuery.of(context).size.width * 0.221,
                                  child: Text(
                                    state.response.articles[i].description,
                                    style: const TextStyle(
                                        fontFamily: "New York Small",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xffFFFFFF)),
                                  ),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.259,
                                  right:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: Text(
                                    state.response.articles[i].content,
                                    style: GoogleFonts.nunito(
                                        fontSize: 10,
                                        fontWeight: FontWeight.w400,
                                        color: const Color(0xffFFFFFF)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
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
