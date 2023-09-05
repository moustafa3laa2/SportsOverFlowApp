import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sports_app_green_eagles/data/list/onBoardingList.dart';
import 'package:sports_app_green_eagles/screens/Homepage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class onBoarding extends StatefulWidget {
  const onBoarding({super.key});

  @override
  State<onBoarding> createState() => _onBoardingState();
}

class _onBoardingState extends State<onBoarding> {
  late PageController _pageController;

  int _pageIndex = 0;

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
                                builder: (context) => Homepage(),
                              ),
                            );
                          },
              // Padding(
              //   padding: EdgeInsets.all(16),
            
                child: Text(
                  
                  "Skip",
                  style: TextStyle(
                      color: Colors.black,
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
            child: Stack(children: [
              Container(
                
                height: size.height,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) async {
                    if (index != 2) {
                      await Future.delayed(Duration(seconds: 3));
                      _pageController.nextPage(
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    } else {
                      await Future.delayed(Duration(seconds: 3));
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    }
                  },
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color.fromARGB(255, 235, 232, 232),
                          //     blurRadius: 5,
                          //     offset: Offset(0, 5),
                          //   ),
                          // ],
                        ),
                        margin: EdgeInsets.only(
                            top: size.height / 6,
                            bottom: size.height / 6,
                            left: 10,
                            right: 10),
                        child: Column(
                          children: [
                        
                            Expanded(
                                child:
                                    Image.asset(OnBoardingList[index]["image"],color: Colors.purple,)),
                          
                           Container(
                                margin: EdgeInsets.only(bottom: 16),

                                
                                child: Text(
                                  OnBoardingList[index]["title"],
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "SofiaProBold",
                                      color: Colors.yellow),
                                )),
                            Container(
                                child: Text(
                              OnBoardingList[index]["description"],
                              style: TextStyle(
                                 fontFamily: "SofiaProBold",
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
                      SizedBox(height: 520,),
                       
                        Center(
                          child: SmoothPageIndicator(
                            
                            effect: ExpandingDotsEffect(
                                activeDotColor: Colors.black),
                            controller: _pageController,
                            count: 3,
                            onDotClicked: (index) {
                              _pageController.animateToPage(index,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.easeInOut);
                            },
                          ),
                        ),
                      ]))
            ])));
  }
}

class Dotindicatotr extends StatelessWidget {
  const Dotindicatotr({super.key, this.isactive = false});
  final bool isactive;

  @override
  Widget build(BuildContext context) {
    return isactive
        ? Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.yellow,
            ),
          )
        : Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.grey,
            ),
          );
  }
}