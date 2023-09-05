import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sports_app_green_eagles/data/componant/myText.dart';
import 'package:sports_app_green_eagles/data/componant/squareTile.dart';
import 'package:sports_app_green_eagles/screens/Homepage.dart';
import 'package:flutter/material.dart';
import 'package:sports_app_green_eagles/services/auth_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  double _sigmaX = 5; // from 0-10
  double _sigmaY = 5; // from 0-10
  double _opacity = 0.2;
  double _width = 350;
  double _height = 300;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    AuthService authService =AuthService();
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(alignment: Alignment.center, children: [
                  Image.asset(
                    'assets/images/mosalah.jpg',
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    fit: BoxFit.cover,
                  ),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.05),
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.18),
                        const Text("Login ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02),
                        ClipRect(
                            child: BackdropFilter(
                                filter: ImageFilter.blur(
                                    sigmaX: _sigmaX, sigmaY: _sigmaY),
                                child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(0, 0, 0, 1)
                                            .withOpacity(_opacity),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                    width:
                                        MediaQuery.of(context).size.width * 1,
                                    height: MediaQuery.of(context).size.height *
                                        0.5,
                                    child: Form(
                                      key: _formKey,
                                      child: Center(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            // username textfield
                                            MyTextField(
                                              controller: usernameController,
                                              hintText: 'your phone',
                                              obscureText: false,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),

                                            const SizedBox(height: 10),

                                            // sign in button
                                            // MyButton(
                                            //   onTap: (() {
                                            //     if (_formKey.currentState!.validate()) {
                                            //       Navigator.push(
                                            //         context,
                                            //         MaterialPageRoute(
                                            //             builder: (context) => Signup()),
                                            //       );
                                            //     } else {
                                            //       print('not valid');
                                            //   }
                                            // }),

                                            const SizedBox(height: 10),

                                            // or continue with
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Divider(
                                                    thickness: 0.5,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                                const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.0),
                                                  child: Text(
                                                    'Or',
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Divider(
                                                    thickness: 0.5,
                                                    color: Colors.grey[400],
                                                  ),
                                                ),
                                              ],
                                            ),

                                            const SizedBox(height: 10),

                                            ElevatedButton(
                                              child: Text(' Send Code',style: TextStyle(fontFamily: 'SofiaProBold',color: Colors.white,fontSize: 18),),
                                              style: ElevatedButton.styleFrom(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25.0), // Adjust the radius as needed
                                                  ),
                                                  backgroundColor:
                                                      Colors.purple,
                                                  elevation: 10,
                                                  minimumSize: Size(130, 40)),
                                              onPressed: () {
                                                String randomNumber =
                                                    generateRandomNumber();
                                                showDialog(
                                                  context: context,
                                                  builder:
                                                      (BuildContext context) {
                                                    TextEditingController
                                                        _textEditingController =
                                                        TextEditingController();
                                                    return AlertDialog(
                                                      title: Text(
                                                          'Verification Code',style: TextStyle(
                                                              fontSize: 30,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,fontFamily: 'SofiaPro'
                                                            ),),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            randomNumber,
                                                            style: TextStyle(
                                                              fontSize: 40,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,fontFamily: 'SofiaPro'
                                                            ),
                                                          ),
                                                          SizedBox(height: 20),
                                                          TextField(
                                                            controller:
                                                                _textEditingController,
                                                            decoration:
                                                                InputDecoration(
                                                              labelText:
                                                                  ' Please Enter 4 Digit pin ',
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      actions: <Widget>[
                                                        ElevatedButton(
                                                          child: Text(
                                                            'Verify',style: TextStyle(fontFamily: 'SofiaProBold',fontSize: 18,color: Colors.white),
                                                          ),
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  shape:
                                                                      RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            25.0), // Adjust the radius as needed
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .purple,
                                                                  elevation: 10,
                                                                  minimumSize:
                                                                      Size(130,
                                                                          40)),
                                                          onPressed: () {
                                                            String
                                                                enteredNumber =
                                                                _textEditingController
                                                                    .text;
                                                            if (enteredNumber ==
                                                                randomNumber) {
                                                              Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          Homepage(),
                                                                ),
                                                              );
                                                            } else {
                                                              showDialog(
                                                                context:
                                                                    context,
                                                                builder:
                                                                    (BuildContext
                                                                        context) {
                                                                  return AlertDialog(
                                                                    title: Text(
                                                                        'Wrong'),
                                                                    content: Text(
                                                                        'This number not vaild '),
                                                                    actions: <
                                                                        Widget>[
                                                                      ElevatedButton(
                                                                        child: Text(
                                                                            'Ok'),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .pop();
                                                                        },
                                                                      ),
                                                                    ],
                                                                  );
                                                                },
                                                              );
                                                            }
                                                          },
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),


                                             InkWell(
            onTap: () => authService.handleSignIn(),
            child: Image.asset('assets/images/google.png',height: 30,width: 30,))

                                            // ElevatedButton(
                                            //     onPressed: () {},
                                            //     child: Text(
                                            //       // imagePath: 'assets/images/google.png',
                                            //       "Login with Google",
                                            //     ),
                                            //     style: ElevatedButton.styleFrom(
                                            //       shape: RoundedRectangleBorder(
                                            //         borderRadius:
                                            //             BorderRadius.circular(
                                            //                 15), // Adjust the radius as needed
                                            //       ),
                                            //       backgroundColor:
                                            //           Colors.purple,
                                            //       elevation: 15,
                                            //     )),
                                          ],
                                        ),
                                      ),
                                    ))))
                      ])
                ]))));
  }

  static String generateRandomNumber() {
    Random random = Random();
    int number =
        random.nextInt(9000) + 1000; // توليد رقم عشوائي بين 1000 و 9999
    return number.toString();
  }
}
























// import 'package:flutter/material.dart';
// import 'package:sports_app_green_eagles/services/auth_services.dart';

// class LoginScreen extends StatelessWidget {
//   const LoginScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     AuthService authService =AuthService();
//     return Scaffold(
      
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           const SizedBox(width: double.infinity,),
//            TextFormField(
                       
//                         decoration: InputDecoration(
//                           prefixIcon: const Icon(Icons.phone_android),
//                           hintText: "(+20) 012 3456 789",
                          
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.grey,
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: const BorderSide(
//                               color: Colors.green,
//                               width: 2,
//                             ),
//                             borderRadius: BorderRadius.circular(40),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          
//           InkWell(
//             onTap: () => authService.handleSignIn(),
//             child: Image.asset('assets/images/google.png',height: 30,width: 30,))
//         ],
//       ),
//     );
//   }
// }