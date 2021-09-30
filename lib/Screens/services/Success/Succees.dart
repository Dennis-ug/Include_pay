import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:includepay/Screens/services/Savings/savingController.dart';
import 'package:includepay/tools/colors.dart';
import 'package:get/get.dart';

class Succees extends StatelessWidget {
  Succees({Key? key}) : super(key: key);
  // final _contro = Get.find(SavingsContro(null));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCheckCircle,
                  size: 100,
                  color: greenLight,
                ),
                Text("\n\nRequest Submited\n"),
                Text(
                  """Thank you for Saving with us""",
                  textAlign: TextAlign.center,
                ),
                // SizedBox(
                //   height: context.height * 0.4,
                // ),
                MaterialButton(
                  minWidth: 400,
                  color: Color(0xFFF9C404),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
