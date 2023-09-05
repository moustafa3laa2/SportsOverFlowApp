import 'package:flutter/material.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
import 'package:sports_app_green_eagles/screens/login_screen.dart';
import 'package:sports_app_green_eagles/services/auth_services.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  TopBar({super.key, required this.barName});
  // List titles = ["COUNTRIES & LATEST NEWS", "Latest News", "LEAGUES","SPORTS OVERFLOW"];
  // final int index;
  String barName;
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return AppBar(
      elevation: 0,
        backgroundColor: const Color(0xFF38003C),
        leading: const BackButton(
        color: Colors.white,
        
        ),
        // actions: [
        //   IconButton(
        //     onPressed: () {
        //       authService.handleSignOut();
        //       Navigator.push(
        //         context,
        //         MaterialPageRoute<void>(
        //           builder: (BuildContext context) => const AuthPage(),
        //         ),
        //       );
        //     },
        //     icon: const Icon(Icons.logout,color: Colors.white,),
        //   ),
        // ],
        title: Text(
         barName,
          style: const TextStyle(
              fontFamily: "SofiaProBold",
              color: Colors.white,
              fontWeight: FontWeight.w600),
        ));
  }
}
