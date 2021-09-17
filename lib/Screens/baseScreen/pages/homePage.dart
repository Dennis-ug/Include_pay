import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/My%20sacco%20/mySacco.dart';
import 'package:includepay/tools/colors.dart';
import 'package:includepay/tools/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required double screen,
  })  : _screen = screen,
        super(key: key);

  final double _screen;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      // alignment: Alignment.topLeft,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: context.height * 0.2,
                width: context.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            height: context.height * 0.14,
                            child: FittedBox(
                              child: Container(
                                width: context.width * 0.3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Welcome",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: Color(0xFF737373),
                                        )),
                                    Text(
                                      "What would you like to today?",
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Color(0xFF737373),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: greenLight,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: FaIcon(
                              FontAwesomeIcons.solidBell,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.height * 0.02,
              ),

              Container(
                // color: Colors.black45,
                child: Column(
                  children: [
                    Container(
                      height: 154,
                      child: null,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Card(
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
                                          icon: FontAwesomeIcons.moneyBillWave,
                                          lebel: "My Sacco",
                                        ),
                                      ),
                                    ),
                                    FittedBox(
                                      child: iconHolder(
                                        icon: FontAwesomeIcons.leaf,
                                        lebel: "Farming",
                                      ),
                                    ),
                                    FittedBox(
                                      child: iconHolder(
                                        icon: FontAwesomeIcons.shoppingCart,
                                        lebel: "Shopping",
                                      ),
                                    ),
                                    FittedBox(
                                      child: iconHolder(
                                        icon: FontAwesomeIcons.handHoldingHeart,
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
                    SizedBox(
                      height: context.height * 0.02,
                    ),
                    Container(
                      height: 106,
                      width: context.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xFF73B41A),
                              greenLight,
                            ]),
                      ),
                      child: Center(
                        child: Text(
                          "Securely and conveniently access a wide range of online payment services",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ),
                    Padding(
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
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF737373),
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
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.creditCard,
                                              lebel: "Banking",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.1,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.lightbulb,
                                              lebel: "Utilities",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.1,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.ticketAlt,
                                              lebel: "Tickects",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.1,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.creditCard,
                                              lebel: "Banking",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: context.width * 0.04,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle),
                                      child: Center(
                                        child: FittedBox(
                                          child: Padding(
                                            padding: const EdgeInsets.all(15),
                                            child: iconHolder(
                                              icon: FontAwesomeIcons.school,
                                              lebel: "School fees",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // Scroll end

              SizedBox(
                height: context.height * 0.002,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
