import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/tools/colors.dart';
import '/Screens/baseScreen/baseController.dart';
import 'pages/homePage.dart';

class BaseView extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);
  final contro = Get.put(TabControl());
  final double _screen = 640.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F7F7),
      body: SizedBox.expand(
          child: PageView(
        physics: new NeverScrollableScrollPhysics(),

        //physics: ScrollPhysics(parent: ScrollPhysics()),
        controller: contro.pageController,
        children: [
          HomePage(screen: _screen),
          //Profile panel
          Container(
              child: Center(
            child: Image.asset("assets/coming-soon.png"),
          )
              // Column(
              //   children: [
              //     Container(
              //       child: Padding(
              //         padding: const EdgeInsets.only(top: 30),
              //         child: Stack(
              //           children: [
              //             CircleAvatar(
              //               backgroundColor: Colors.white,
              //               radius: 50,
              //               child: FaIcon(
              //                 FontAwesomeIcons.solidUser,
              //                 color: greenLight,
              //                 size: 50,
              //               ),
              //             ),
              //             Positioned(
              //               left: 70,
              //               top: 70,
              //               child: Container(
              //                 decoration: BoxDecoration(
              //                   shape: BoxShape.circle,
              //                   color: greenLight,
              //                 ),
              //                 child: Padding(
              //                   padding: const EdgeInsets.all(4),
              //                   child: Icon(
              //                     Icons.edit,
              //                     color: Colors.white,
              //                     size: 20,
              //                   ),
              //                 ),
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(horizontal: 20),
              //       child: Container(
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [Text("Name"), Text("data")],
              //         ),
              //       ),
              //     )
              //   ],
              // // ),
              // child: Center(
              //   child: Text(
              //     'Profile Comming soon',
              //     style: TextStyle(fontSize: 30),
              //   ),
              // ),
              ),
          Container(
            child: Center(
              child: Image.asset("assets/coming-soon.png"),
            ),
          ),
          Container(
            child: Center(
              child: Image.asset("assets/coming-soon.png"),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'Home 5',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ],
      )),
      bottomNavigationBar: Obx(
        () => BottomNavyBar(
          backgroundColor: Colors.white,
          selectedIndex: contro.currentIndex.value,
          showElevation: true,
          itemCornerRadius: 24,
          curve: Curves.easeIn,
          onItemSelected: (index) {
            contro.currentIndex.value = index;
            contro.pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.home),
              title: Text('Home'),
              activeColor: greenLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.solidUserCircle),
              title: Text('Account'),
              activeColor: greenLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.solidBell),
              title: Text('Notification'),
              activeColor: greenLight,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: FaIcon(FontAwesomeIcons.wrench),
              title: Text('Settings'),
              activeColor: greenLight,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
