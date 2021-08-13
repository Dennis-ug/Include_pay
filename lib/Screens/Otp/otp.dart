import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/Otp/otpController.dart';
import 'package:includepay/Screens/baseScreen/mainBase.dart';
import 'package:includepay/tools/colors.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OptView extends StatelessWidget {
  OptView({Key? key}) : super(key: key);

  final contro = Get.put(OtpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(),
          height: MediaQuery.of(context).size.height * 0.8,
          width: MediaQuery.of(context).size.width * 0.8,
          child: Column(
            children: [
              FaIcon(
                FontAwesomeIcons.userShield,
                size: 150,
                color: greenLight,
              ),
              Container(
                  child: Container(
                child: Column(
                  children: [
                    Text(
                      "\n OTP Verication",
                      style: TextStyle(fontSize: 25, color: greenLight),
                    ),
                    PinFieldAutoFill(
                      controller: contro.pinControler,
                      autoFocus: true,
                      cursor: Cursor(color: greenLight),
                      //
                      // decoration: // UnderlineDecoration, BoxLooseDecoration or BoxTightDecoration see https://github.com/TinoGuo/pin_input_text_field for more info,
                      // prefill with a code
                      onCodeSubmitted:
                          (String valve) {}, //code submitted callback
                      onCodeChanged: (String? value) {
                        // print('typing $value and the length is ${value!.length}');
                        if (value!.length == 5) {
                          print("pin done");
                          contro.test();
                          contro.otpVarification();
                          // contro.otpVarification(value);
                          // print("waiting for response");
                          // contro.isSubmmiting.value = true;

                          if (contro.isReady.value == true) {
                            print("screen ready....");
                            Get.to(() => BaseView());
                          }
                        }
                      },
                      codeLength: 5,
                      decoration: UnderlineDecoration(
                        bgColorBuilder: FixedColorBuilder(Colors.grey),
                        colorBuilder: FixedColorBuilder(
                          greenLight,
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  // : Container(
                  //     height: context.height * 0.5,
                  //     child: Center(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           CircularProgressIndicator(
                  //             color: greenLight,
                  //           ),
                  //           Text(
                  //             "\n \n Verifying....",
                  //             style:
                  //                 TextStyle(color: greenLight, fontSize: 30),
                  //           )
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
