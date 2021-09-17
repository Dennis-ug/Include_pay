import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/route_manager.dart';
import 'package:includepay/Screens/signAct/SignIn/SignIn.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'introdata/introdata.dart';

class Intro extends StatelessWidget {
  const Intro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroWig(),
    );
  }
}

/*
To do
Remove the white background by initialising
 */
class IntroWig extends StatelessWidget {
  IntroWig({Key? key}) : super(key: key);

  final _introKey = GlobalKey<IntroductionScreenState>();
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 15, color: Colors.white);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(
          fontSize: 28.0, fontWeight: FontWeight.w700, color: Colors.white),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.transparent,
      imagePadding: EdgeInsets.zero,
    );
    return Container(
      child: IntroductionScreen(
        key: _introKey,
        globalBackgroundColor: Colors.transparent,
        globalHeader: Align(
          alignment: Alignment.topRight,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 16, right: 16),
              child: null,
            ),
          ),
        ),
        pages: introdata
            .map(
              (IntroModels e) => PageViewModel(
                title: e.title,
                body: e.body,
                image: Image.asset(
                  e.img,
                  fit: BoxFit.fill,
                  height: double.infinity,
                  width: double.infinity,
                  alignment: Alignment.center,
                ),
                decoration: pageDecoration.copyWith(
                  bodyAlignment: Alignment.bottomCenter,
                  contentMargin: const EdgeInsets.symmetric(horizontal: 16),
                  fullScreen: true,
                  bodyFlex: 01,
                  imageFlex: 1,
                ),
              ),
            )
            .toList(),
        onDone: () {
          Get.off(() => SignIn());
        },
        showSkipButton: true,
        skipFlex: 0,
        nextFlex: 0,
        skip: const Text('Skip',
            style: TextStyle(color: Color.fromRGBO(110, 181, 14, 1))),
        next: const Icon(
          Icons.arrow_forward,
          color: Color.fromRGBO(110, 181, 14, 1),
        ),
        done: const Text('Get Started',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color.fromRGBO(110, 181, 14, 1))),
        curve: Curves.fastLinearToSlowEaseIn,
        controlsMargin: const EdgeInsets.all(16),
        controlsPadding: kIsWeb
            ? const EdgeInsets.all(12.0)
            : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
        dotsDecorator: const DotsDecorator(
          size: Size(10.0, 10.0),
          color: Color(0xFFBDBDBD),
          activeSize: Size(22.0, 10.0),
          activeColor: Color.fromRGBO(110, 181, 14, 1),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
        ),
      ),
    );
  }
}
