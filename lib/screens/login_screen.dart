import 'package:flutter/material.dart';
import 'package:sports_app_green_eagles/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService =AuthService();
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity,),
           TextFormField(
                       
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.phone_android),
                          hintText: "(+20) 012 3456 789",
                          
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.grey,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          
          InkWell(
            onTap: () => authService.handleSignIn(),
            child: Image.asset('assets/images/google.png',height: 30,width: 30,))
        ],
      ),
    );
  }
}