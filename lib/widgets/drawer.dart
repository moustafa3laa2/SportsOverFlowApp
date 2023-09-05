import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/DrawerCubit/drawer_cubit.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
import 'package:sports_app_green_eagles/services/auth_services.dart';

class DrawerApp extends StatelessWidget {
  const DrawerApp({super.key});

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
                    child: Image(image: AssetImage('assets/images/purple.png'),width: 100,height: 100,),),
                Text(
                  'SPORTS OVERFLOW',
                  style: TextStyle(fontSize: 20, fontFamily: 'SofiaProBold'),
                ),
                ],
              ),
                
            ),
            BlocBuilder<DrawerCubit, DrawerState>(
              builder: (context, state) {
                if(state is DrawerSignInEmail)
                {
                  return ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    style: const TextStyle(fontSize: 15, fontFamily: 'SofiaProBold'),
                  ),
                  onTap: () {},
                );
                }else if(state is DrawerSignInPhone){
                  return ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text(
                'sign in',
                style: TextStyle(fontSize: 20, fontFamily: 'SofiaProBold'),
              ),
              onTap: () {},
            );
                }else{
                  return ListTile(
                  leading: const Icon(Icons.email),
                  title: Text(
                    FirebaseAuth.instance.currentUser!.email.toString(),
                    style: const TextStyle(fontSize: 15, fontFamily: 'SofiaProBold'),
                  ),
                  onTap: () {},
                );
                }
                
              },
            ),
            
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text(
                'Logout',
                style: TextStyle(fontSize: 20, fontFamily: 'SofiaProBold'),
              ),
              onTap: () {authService.handleSignOut();
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => const AuthPage(),
                ),
              );},
            ),
          ],
        ),
      ),
    );
  }
}
