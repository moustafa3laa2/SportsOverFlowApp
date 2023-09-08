import 'package:flutter/material.dart';
import 'package:sports_app_green_eagles/data/list/onBoardingList.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
import 'package:sports_app_green_eagles/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;

  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return FutureBuilder<bool>(
      future: checkOnboardingStatus(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data == true) {
          // تم تخطي صفحة onboarding بالفعل
          // return AuthPage();
          return LoginScreen();
        } else {
          // عرض صفحة onboarding
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setBool('onboarding_skipped', true);
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => AuthPage(),
                      //   ),
                      // );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(
                          color: Colors.purple,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            body: Container(
              color: Colors.white,
              height: size.height,
              width: size.width,
              child: Stack(
                children: [
                  Container(
                    height: size.height,
                    child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (index) async {
                        if (index != 2) {
                          await Future.delayed(Duration(seconds: 3));
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          await Future.delayed(Duration(seconds: 3));
                          _pageController.animateToPage(
                            0,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        }
                      },
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          margin: EdgeInsets.only(
                            top: size.height / 6,
                            bottom: size.height / 6,
                            left: 10,
                            right: 10,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.asset(
                                  OnBoardingList[index]["image"],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 16),
                                child: Text(
                                  OnBoardingList[index]["title"],
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "SofiaPro",
                                    color: Colors.purple,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  OnBoardingList[index]["description"],
                                  style: TextStyle(
                                    fontFamily: "SofiaPro",
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 520,
                        ),
                        Center(
                          child: SmoothPageIndicator(
                            effect: ExpandingDotsEffect(
                              activeDotColor: Colors.purple,
                            ),
                            controller: _pageController,
                            count: 3,
                            onDotClicked: (index) {
                              _pageController.animateToPage(
                                index,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<bool> checkOnboardingStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool onboardingSkipped = prefs.getBool('onboarding_skipped') ?? false;
    return onboardingSkipped;
  }
}
