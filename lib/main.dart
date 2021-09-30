import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/intro/intro.dart';
import 'constants/constants.dart';

Future<void> main() async {
  //  GlobalBindings().dependencies();
  // await getPref();
  runApp(IncludePay());
}

late bool slidesIsVied;
late bool signedIn;

Future<void> getPref() async {
  SharedPreferences _pref = await SharedPreferences.getInstance();
  // _pref.setBool(slideViewed, false);
  // _pref.setBool(userSignedIn, false);
  bool _slided = _pref.getBool(slideViewed)!;
  bool _sign = _pref.getBool(userSignedIn)!;
  if (_slided != true && _sign != true) {
    slidesIsVied = _slided;
    signedIn = _sign;
  } else {
    slidesIsVied = false;
    signedIn = false;
  }
}

class IncludePay extends StatelessWidget {
  IncludePay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        theme: ThemeData(
          fontFamily: null,
          textTheme: TextTheme(),
          primaryColor: Color.fromRGBO(0, 179, 13, 1),
          primaryTextTheme: TextTheme(
            bodyText1: TextStyle(fontFamily: " Poppins-reg"),
          ),
        ),
        home: Intro()
        // FutureBuilder(
        //   future: getPref.call(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //           child: Container(
        //         child: CircularProgressIndicator(
        //           color: greenLight,
        //         ),
        //       ));
        //     } else if (slidesIsVied == true && signedIn == true) {
        //       return BaseView();
        //     } else if (slidesIsVied == true && signedIn != true) {
        //       return SignIn();
        //     } else {
        //       return Intro();
        //     }
        //   },
        // )
        // OptView()
        // Intro(),
        );
  }
}
