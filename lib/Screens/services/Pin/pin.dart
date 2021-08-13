import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:includepay/tools/colors.dart';

import 'pinController.dart';

class PinView extends StatelessWidget {
  PinView({Key? key}) : super(key: key);
  final _contro = Get.put(PinsControl());
  final List test = [
    // dots
    [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
    //1 dot
    [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
    //2 dot
    [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
    // 3 dot
    [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: textBoarderColor,
          shape: BoxShape.circle,
        ),
      ),
    ],
    // 4 dots
    [
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
      Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          color: themeOrange,
          shape: BoxShape.circle,
        ),
      ),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: Center(
          child: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.userLock,
                color: greenLight,
                size: context.height * 0.15,
              ),
              Text("\nPlease enter your Include Pay pin\n"),
              rowdots(),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: context.height * 0.6,
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisCount: 3,
                          childAspectRatio: 1.5,
                        ),
                        shrinkWrap: true,
                        children: [
                          gridCont(label: "1", isColored: true),
                          gridCont(label: "2", isColored: true),
                          gridCont(label: "3", isColored: true),
                          gridCont(label: "4", isColored: true),
                          gridCont(label: "5", isColored: true),
                          gridCont(label: "6", isColored: true),
                          gridCont(label: "7", isColored: true),
                          gridCont(label: "8", isColored: true),
                          gridCont(label: "9", isColored: true),
                          GestureDetector(
                            onTap: () {
                              _contro.del();
                            },
                            child: Container(
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.backspace,
                                ),
                              ),
                            ),
                          ),
                          gridCont(
                            label: "0",
                            isColored: true,
                          ),
                          Container(
                            child: Center(
                              child: FaIcon(
                                FontAwesomeIcons.check,
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
    );
  }

  Container rowdots() {
    return Container(
      height: 15,
      width: 150,
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: test[_contro.dotNum.value],
        ),
      ),
    );
  }

  Container pindot(Color clr) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        color: clr,
        shape: BoxShape.circle,
      ),
    );
  }

  Container gridCont({required String label, bool? isColored}) {
    return Container(
      child: Container(
        clipBehavior: Clip.hardEdge,
        height: 1,
        width: 1,
        decoration: BoxDecoration(
          color: isColored == true ? Colors.grey[300] : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Center(
            child: TextButton(
          onPressed: () {
            _contro.upDatePin(label);
          },
          child: Text(
            "$label",
            style: TextStyle(
              fontSize: 30,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        )),
      ),
    );
  }
}
