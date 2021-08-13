import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:includepay/tools/colors.dart';
import 'package:get/get.dart';

class Succees extends StatelessWidget {
  const Succees({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                FaIcon(
                  FontAwesomeIcons.solidCheckCircle,
                  size: 100,
                  color: greenLight,
                ),
                Text("\n\nRequest Submited\n"),
                Text(
                  """Thank you for Saving with us. Your loan request has been received and is pending approval. Onceapproved, you will be nofitied.""",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: context.height * 0.4,
                ),
                MaterialButton(
                  minWidth: 400,
                  color: themeOrange,
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
