import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetPlayerCubit/get_player_cubit.dart';

class searchplayer extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
   
    return [
     IconButton(onPressed: (
         ) {
       query="";

     }, icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return
      IconButton(onPressed: (
          ) {
        Navigator.pop(context);

      }, icon: const Icon(Icons.arrow_back_ios));

  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        BlocBuilder<GetplayerCubit, GetplayerState>(
          builder: (context, state) {
            if (state is GetplayerInitial) {
              return const Center(child: Text(""));
            } else if (state is loding) {
              return const Align(
                  alignment: Alignment.center,
                  child: Center(child: CircularProgressIndicator()));
            } else if (state is getplayerscucces) {
              return Expanded(
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      children: [

                      ],
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.Result.result?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: const Color(0xFF38003C).withOpacity(1),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         PlayerInformation(),
                              //   ),
                              // );
                            },
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(0),
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: const Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder:
                                            //         (BuildContext context) =>
                                            //             PlayerInformation(),
                                            //   ),
                                            // );
                                          },
                                          icon: const Icon(Icons.arrow_forward,
                                              color: Colors.black),
                                        ),
                                        const SizedBox(width: 20),
                                        Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.Result.result?[index]
                                                  .playerName as String ??
                                                  " ",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontFamily: 'SofiaProBold',
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              state.Result.result?[index]
                                                  .playerType as String ??
                                                  " ",
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 17,
                                                color: Colors.black,
                                                fontFamily: 'SofiaProBold',
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Image.network(
                                          state.Result.result![index]
                                              .playerImage ??
                                              "",
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                            return const Text("");
                                          },
                                          height: 80,
                                          width: 40,
                                          fit: BoxFit.fill,
                                        ),
                                        const SizedBox(width: 15),
                                        Text(
                                          "$index",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.black,
                                            fontFamily: 'SofiaProBold',
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text("error"));
            }
          },
        ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(child: Text("search"),);
  }

}