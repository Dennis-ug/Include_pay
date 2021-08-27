import 'dart:ui';

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/tools/widgets.dart';
import '/Screens/My%20sacco%20/mySacco.dart';
import '/tools/colors.dart';
import '/Screens/baseScreen/baseController.dart';

class BaseView extends StatelessWidget {
  BaseView({Key? key}) : super(key: key);
  final contro = Get.put(TabControl());
  final double _screen = 640.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SizedBox.expand(
          child: PageView(
        //physics: ScrollPhysics(parent: ScrollPhysics()),
        controller: contro.pageController,
        children: [
          Container(
            height: double.infinity,
            alignment: Alignment.topLeft,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: context.height * 0.3,
                  width: context.width,
                  decoration: BoxDecoration(
                    color: greenLight,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: context.height * 0.125,
                      width: context.width * 0.85,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: SizedBox(
                                  height: context.height * 0.14,
                                  child: FittedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Welcome",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 30,
                                              color: Colors.white,
                                            )),
                                        Text(
                                          "John, What would you like to today?",
                                          style: TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 8.0),
                          //   child: Row(
                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //     children: [
                          //       Column(
                          //         children: [
                          //           Container(
                          //             child: Stack(
                          //               children: [
                          //                 CircleAvatar(
                          //                   radius: context.height * 0.045,
                          //                   child: Text(
                          //                     "JM",
                          //                     style: TextStyle(
                          //                         fontSize:
                          //                             context.height * 0.03),
                          //                   ),
                          //                 ),
                          //               ],
                          //             ),
                          //           ),
                          //           // FittedBox(child: Text("John M"))
                          //         ],
                          //       ),
                          //       Column(
                          //         crossAxisAlignment: CrossAxisAlignment.start,
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Text("John\n"),
                          //           Text("077254568"),
                          //         ],
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                // Scroll b
                SingleChildScrollView(
                  child: Container(
                    // color: Colors.black45,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Get Started",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // color: greenLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(
                                      thickness: 0.8,
                                      color: Colors.black26,
                                    ),
                                    SizedBox(
                                      height: context.height * 0.01,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                            onPressed: () {
                                              print(context.height);
                                              Get.to(() => MySaccoView());
                                            },
                                            child: FittedBox(
                                              child: iconHolder(
                                                icon: FontAwesomeIcons
                                                    .moneyBillWave,
                                                lebel: "My Sacco",
                                              ),
                                            ),
                                          ),
                                          // GestureDetector(
                                          //   onTap: () {
                                          //
                                          //     print('working');
                                          //   },
                                          //   child:
                                          // ),
                                          FittedBox(
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.leaf,
                                              lebel: "Farming",
                                            ),
                                          ),
                                          FittedBox(
                                            child: iconHolder(
                                              icon:
                                                  FontAwesomeIcons.shoppingCart,
                                              lebel: "Shopping",
                                            ),
                                          ),
                                          FittedBox(
                                            child: iconHolder(
                                              icon: FontAwesomeIcons
                                                  .handHoldingHeart,
                                              lebel: "Charity",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        context.height > _screen
                            ? Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    width: context.width,
                                    height: context.height * 0.1,
                                    decoration: BoxDecoration(
                                        // borderRadius: BorderRadius.circular(10),
                                        // gradient: LinearGradient(
                                        //   begin: Alignment.bottomLeft,
                                        //   end: Alignment.topRight,
                                        //   colors: [
                                        //     greenDark,
                                        //     greenLight,
                                        //   ],
                                        // ),
                                        ),
                                    child: Center(
                                      child: Text(
                                        "Rolling burner to be here ",
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container(),
                        SizedBox(
                          height: context.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: context.height < _screen
                                    ? context.height * 0.16
                                    : context.height * 0.2,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Quick action",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            // color: greenLight,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: context.height * 0,
                                    ),
                                    Divider(
                                      thickness: 0.2,
                                      color: Colors.black26,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              child: FittedBox(
                                                child: iconHolder(
                                                  icon: FontAwesomeIcons
                                                      .creditCard,
                                                  lebel: "Banking",
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width * 0.1,
                                            ),
                                            FittedBox(
                                              child: iconHolder(
                                                icon:
                                                    FontAwesomeIcons.lightbulb,
                                                lebel: "Utilities",
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width * 0.1,
                                            ),
                                            FittedBox(
                                              child: iconHolder(
                                                icon:
                                                    FontAwesomeIcons.ticketAlt,
                                                lebel: "Tickects",
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width * 0.1,
                                            ),
                                            FittedBox(
                                              child: iconHolder(
                                                icon:
                                                    FontAwesomeIcons.creditCard,
                                                lebel: "Banking",
                                              ),
                                            ),
                                            SizedBox(
                                              width: context.width * 0.04,
                                            ),
                                            FittedBox(
                                              child: iconHolder(
                                                icon: FontAwesomeIcons.school,
                                                lebel: "School fees",
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                // Scroll end

                SizedBox(
                  height: context.height * 0.002,
                ),
              ],
            ),
          ),
          //Profile panel
          Container(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Stack(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 50,
                          child: FaIcon(
                            FontAwesomeIcons.solidUser,
                            color: greenLight,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          left: 70,
                          top: 70,
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: greenLight,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Name"), Text("data")],
                    ),
                  ),
                )
              ],
            ),
            // child: Center(
            //   child: Text(
            //     'Profile Comming soon',
            //     style: TextStyle(fontSize: 30),
            //   ),
            // ),
          ),
          Container(
            child: Center(
              child: Text(
                'Notification coming soon',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Text(
                'Setting coming soon',
                style: TextStyle(fontSize: 30),
              ),
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
            // BottomNavyBarItem(
            //   icon: FaIcon(FontAwesomeIcons.phoneAlt),
            //   title: Text(
            //     'Support',
            //   ),
            //   activeColor: greenLight,
            //   textAlign: TextAlign.center,
            // ),
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
