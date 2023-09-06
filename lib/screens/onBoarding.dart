import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sports_app_green_eagles/data/list/onBoardingList.dart';
// import 'package:sports_app_green_eagles/screens/Homepage.dart';
import 'package:sports_app_green_eagles/screens/auth.dart';
// import 'package:sports_app_green_eagles/screens/login_screen.dart';
// import 'package:sports_app_green_eagles/screens/splash.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late PageController _pageController;

  // int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState;
    //fristscreen
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AuthPage(),
                  ),
                );
              },
              // Padding(
              //   padding: EdgeInsets.all(16),

              child: const Text(
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
                    await Future.delayed(const Duration(seconds: 3));
                    _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  } else {
                    await Future.delayed(const Duration(seconds: 3));
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  }
                },
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 235, 232, 232),
                            blurRadius: 5,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          top: size.height / 6,
                          bottom: size.height / 6,
                          left: 10,
                          right: 10),
                      child: Column(children: [
                        Expanded(
                            child: Image.asset(
                          OnBoardingList[index]["image"],
                        )),
                        Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            child: Text(
                              OnBoardingList[index]["title"],
                              style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "SofiaPro",
                                  color: Colors.purple),
                            )),
                        Container(
                            child: Text(
                          OnBoardingList[index]["description"],
                          style: const TextStyle(
                            fontFamily: "SofiaPro",
                            fontSize: 18,
                          ),
                        )),
                      ]));
                },
              ),
            ),
            Container(
                // alignment: Alignment(0, 0.90),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  const SizedBox(
                    height: 520,
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.purple),
                      controller: _pageController,
                      count: 3,
                      onDotClicked: (index) {
                        _pageController.animateToPage(index,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut);
                      },
                    ),
                  ),
                ]))
          ],
        ),
      ),
    );
  }
}
