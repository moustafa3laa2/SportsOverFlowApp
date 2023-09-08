import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/screens/searchplayer.dart';
import 'package:sports_app_green_eagles/data/cubits/GetPlayerCubit/get_player_cubit.dart';
import 'package:share/share.dart';
import 'package:sports_app_green_eagles/widgets/drawer.dart';
import 'package:sports_app_green_eagles/widgets/top_bar.dart';
import 'package:url_launcher/url_launcher.dart';


import '../main.dart';

class Players extends StatefulWidget {
  Players({
    Key? key,
    required this.teamname, required this.teamKey,
  }) : super(key: key);
  final String teamname;
  final int teamKey;
  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  void initState() {
    super.initState();

    context.read<GetplayerCubit>().getplayer(widget.teamKey);
  }

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
        title: Text(widget.teamname,style: TextStyle(fontSize: 25,
                  fontFamily: 'SofiaProBold',
                  color: Color(0xFFFFFFFF),),),),
      body: Column(
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
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: SearchWidget(),
                      // ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.Result.result?.length,
                          itemBuilder: (BuildContext context, int index) {
                            String? a1 =
                                state.Result.result?[index].playerName ?? " ";
                            String? a2 =
                                state.Result.result?[index].playerNumber ?? " ";
                            String? a3 =
                                state.Result.result?[index].playerCountry ??
                                    " ";
                            String? a4 =
                                state.Result.result?[index].playerImage ?? " ";
                            String? a5 =
                                state.Result.result?[index].playerType ?? " ";
                            String? a6 =
                                state.Result.result?[index].playerAge ?? " ";
                            String? a7 =
                                state.Result.result?[index].playerYellowCards ??
                                    " ";
                            String? a8 =
                                state.Result.result?[index].playerRedCards ??
                                    " ";
                            String? a9 =
                                state.Result.result?[index].playerGoals ?? " ";
                            String? a10 =
                                state.Result.result?[index].playerAssists ??
                                    " ";
                            String? a11 =
                                state.Result.result?[index].teamName ?? " ";

                            return InkWell(
                              splashColor: const Color(0xFF38003C).withOpacity(1),
                              onTap: () {
                                _showPlayerDetailsDialog(context, a1, a2, a3,
                                    a4, a5, a6, a7, a8, a9, a10, a11);
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
                                              _showPlayerDetailsDialog(
                                                  context,
                                                  a1,
                                                  a2,
                                                  a3,
                                                  a4,
                                                  a5,
                                                  a6,
                                                  a7,
                                                  a8,
                                                  a9,
                                                  a10,
                                                  a11);
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
                                            width: 80,
                                            fit: BoxFit.fill,
                                          ),
                                          // SizedBox(width: 15),
                                          // Text(
                                          //   state.Result.result?[index]
                                          //           .playerNumber ??
                                          //       " ",
                                          //   style: TextStyle(
                                          //     fontSize: 20,
                                          //     color: Colors.black,
                                          //     fontFamily: 'Sofia',
                                          //     fontWeight: FontWeight.bold,
                                          //   ),
                                          // ),
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
      ),
    );
  }
}

void _showPlayerDetailsDialog(
  BuildContext context,
  String playerName,
  String playernumber,
  String playercountry,
  String playerimgae,
  String playerPosition,
  String playerage,
  String playeryellow,
  String playererd,
  String playergoals,
  String playerassists,
  String team,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        buttonPadding: const EdgeInsetsDirectional.all(15),
        backgroundColor: Colors.transparent,
        icon: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.share),
                color: Colors.white,
                onPressed: () => _openWhatsAppWeb(playerName, team),
              ),
              backgroundColor: const Color(0xFF38003C)),
        ),
        iconPadding: const EdgeInsets.only(top: 20, bottom: 20),
        iconColor: Colors.white,
        content: SizedBox(
          width: 400, // Set the desired width for the AlertDialog
          child: SingleChildScrollView(
            child: Card(
              elevation: 3,
              shape: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color(0xFF38003C),
                  width: 4,
                ),
              ),
              shadowColor: Colors.blueAccent.withOpacity(1),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Add padding to the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playerName,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'SofiaProBold',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  playernumber,
                                  style: const TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontFamily: 'SofiaProBold',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Image.network(
                            playerimgae,
                            errorBuilder: (context, error, stackTrace) {
                              return const Text(
                                "",
                                style: TextStyle(color: Colors.red),
                              );
                            },
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Divider(
                      height: 30,
                      thickness: 4,
                      color: Color(0xFF38003C),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Player Age:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerage,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Position:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerPosition,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Player Assist : ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerassists,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "player goals:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playergoals,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color(0xFF38003C),
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "player yellow cards:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playeryellow,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "player Red cards:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playererd,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "player team:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          team,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Nationality:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playercountry,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'SofiaProBold',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

Future<void> _openWhatsAppWeb(String playerName, String team) async {
  final String textToShare = "Player Name: $playerName\nClub: $team";
  Share.share(textToShare);

  // if (!await launchUrl(_url)) {
  //   throw Exception('Could not launch $_url');
  // }
}