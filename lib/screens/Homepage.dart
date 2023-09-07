import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sports_app_green_eagles/data/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/data/list/HomePageList.dart';
import 'package:sports_app_green_eagles/screens/countries_screen.dart';
import 'package:sports_app_green_eagles/screens/onBoarding.dart';
import 'package:sports_app_green_eagles/widgets/drawer.dart';
import 'package:sports_app_green_eagles/widgets/top_bar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final Color secondColor = Color.fromARGB(255, 221, 214, 214);
    final Color thirdColor = Color.fromARGB(255, 236, 232, 232);

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: TopBar(barName: 'SPORTSOVERFLOW',),
      endDrawer: const DrawerApp(),
      // backgroundColor: Color(color),
      body: SafeArea(
        child: Column(
          children: [
            // Container(
            //   color: Colors.purple,
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   height: size.height * 1 / 10,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     // crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       // InkWell(
            //       //   onTap: () {
            //       //     Navigator.pop(context);
            //       //   },
            //       //   // child: Icon(
            //       //   //   Icons.arrow_back_ios_rounded,
            //       //   //   color: Colors.yellow,
            //       //   // ),
            //       // ),
            //       Row(
            //         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             'SPORTS OVERFlOW',
            //             style: GoogleFonts.adamina(
            //                 fontSize: 15, fontWeight: FontWeight.bold),
            //           ),
            //           // Image.asset(
            //           //   'images/white.png',
            //           //   // height:5,
            //           //   // width: 5,
            //           //   color: Colors.white,
            //           // ),
                     
            //         ],
            //       )
            //     ],
            //   ),
            // ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: size.height / 2 - size.height * 1 / 15),
                itemBuilder: (context, index) {
                  return Expanded(
                      child: InkWell(
                    onTap: () {
                      index != 0
                          ? showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  title: Center(
                                      child: Text(
                                    'Coming Soon ...',
                                    style: GoogleFonts.aBeeZee(fontSize: 28),
                                  )),
                                  content: const Text('unavailable now'),
                                );
                              })
                          : {Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CountriesScreen(),
                              ),
                            ),context.read<GetCountriesCubit>().getCountries()};
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: thirdColor,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: secondColor,
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            HomePageList[index]['image'],
                            height: 200,
                            width: 800,
                          ),
                          Text(
                            HomePageList[index]['name'],
                            style: const TextStyle(fontSize: 30),
                          )
                        ],
                      ),
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}