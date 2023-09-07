import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sports_app_green_eagles/data/cubits/DrawerCubit/drawer_cubit.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
import 'package:sports_app_green_eagles/services/auth_services.dart';

class DrawerApp extends StatelessWidget {
  DrawerApp({Key? key});

  // Declare phone as a Future<String> to handle the asynchronous operation
  Future<String> phone = savenumber();

  static Future<String> savenumber() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('action') ?? "";
  }

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            const DrawerHeader(
              child: Column(
                children: [
                  Center(
                    child: Image(
                      image: AssetImage('assets/images/purple.png'),
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Text(
                    'SPORTS OVERFLOW',
                    style: TextStyle(fontSize: 20, fontFamily: 'SofiaProBold'),
                  ),
                ],
              ),

            ),
            BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                if (state is DrawerSignInEmail || state is DrawerInitial) {
                  return ListTile(
                    leading: const Icon(Icons.email),
                    title: const Text(
                      'SIGN IN WITH',
                      style: TextStyle(fontSize: 15, fontFamily: 'SofiaProBold'),
                    ),
                    subtitle: Text(
                      FirebaseAuth.instance.currentUser!.email.toString(),
                      style: const TextStyle(
                        fontSize: 15,
                        fontFamily: 'SofiaProBold',
                      ),
                    ),
                  );
                } else if (state is DrawerSignInPhone) {
                  return ListTile(
                    leading: const Icon(Icons.phone_android),
                    title: const Text(
                      'SIGN IN WITH',
                      style: TextStyle(fontSize: 15, fontFamily: 'SofiaProBold'),
                    ),
                    // Use a FutureBuilder to handle the asynchronous operation
                    subtitle: FutureBuilder<String>(
                      future: phone,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Text(
                            "Loading...",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SofiaProBold',
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text(
                            "Error",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SofiaProBold',
                            ),
                          );
                        } else {
                          // Use the retrieved phone number from the snapshot
                          return Text(
                            snapshot.data ?? "555",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'SofiaProBold',
                            ),
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return Text("Error");
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontFamily: 'SofiaProBold'),
              ),
              onTap: () {
                authService.handleSignOut();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const AuthPage()),
                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

