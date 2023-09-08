// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sports_app_green_eagles/screens/Homepage.dart';
// import 'package:sports_app_green_eagles/screens/login_screen.dart';
// import 'package:sports_app_green_eagles/services/auth_services.dart';

// class AuthPage extends StatelessWidget {
//   const AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context, AsyncSnapshot<User?> snapshot) {
//           if(snapshot.connectionState == ConnectionState.waiting){
//             return const Center(child: CircularProgressIndicator(color :Colors.blue),);
//           }
//           if(snapshot.hasData){
//             return Homepage();
//           }else{
//             return  LoginScreen();
//           }
          
//         },
//       ),
//     );
//   }
// }