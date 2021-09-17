import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/Otp/otp.dart';
import 'package:includepay/Screens/baseScreen/mainBase.dart';
import 'package:includepay/Screens/signAct/SignUp/signUp.dart';
import 'package:includepay/tools/colors.dart';
import '/tools/colors.dart';
import '/tools/textStyles.dart';
import 'SignInControl.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Body(),
      ),
    );
  }
}

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);
  final contro = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.height,
      decoration: BoxDecoration(
        image: DecorationImage(
          // colorFilter:
          // ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
          image: AssetImage("assets/login.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 16, right: 16, left: 16, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    "Welcome\nback!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: contro.signInForm,
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      style: TextStyle(color: Colors.white),
                      controller: contro.phoneController,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 13),
                          child: FaIcon(
                            FontAwesomeIcons.phoneAlt,
                            color: greenLight,
                            size: 20,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: textBoarderColor,
                            width: 1,
                          ),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: textBoarderColor,
                            width: 1,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: greenLight,
                            width: 1,
                          ),
                        ),
                        labelText: "Phone Number",
                        hintText: "Enter Phone Number",
                        labelStyle: TextStyle(color: Colors.white),
                        hintStyle: TextStyle(color: greenLight),
                      ),
                      onSaved: (value) {
                        contro.phoneNum = value!;
                      },
                      validator: (String? value) {
                        return contro.validatePhone(value);
                      },
                    ),
                    Obx(() => (TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: contro.passwordController,
                          obscureText: contro.isNotVissible.value,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(top: 13),
                                child: FaIcon(
                                  FontAwesomeIcons.lock,
                                  color: greenLight,
                                  size: 20,
                                ),
                              ),
                              suffixIcon: Padding(
                                padding: const EdgeInsets.only(top: 13.0),
                                child: GestureDetector(
                                  onTap: contro.visi,
                                  child: FaIcon(
                                    contro.isNotVissible.value
                                        ? FontAwesomeIcons.eye
                                        : FontAwesomeIcons.eyeSlash,
                                    color: greenLight,
                                    size: 20,
                                  ),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: textBoarderColor,
                                  width: 1,
                                ),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: textBoarderColor,
                                  width: 1,
                                ),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: greenLight,
                                  width: 1,
                                ),
                              ),
                              labelText: "Password",
                              labelStyle: TextStyle(color: Colors.white),
                              hintText: "Enter your password",
                              hintStyle: TextStyle(color: greenLight)),
                          validator: (String? value) {
                            return contro.validatePassword(value);
                          },
                          onSaved: (String? value) {
                            contro.paswKey = value!;
                            print(value);
                          },
                        )))
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Forgot password?",
                    style: orangeText,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Obx(
                () => GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    // Get.to(() => BaseView());

                    if (contro.validate() == "Correct") {
                      print("Form correct ....");
                      //sign in
                      contro.signIn();
                    } else {
                      contro
                          .dialog("Please Fill in the \n reuired information");
                    }
                  },
                  child: Container(
                    child: Center(
                      child: contro.iSReady.value == false
                          ? Text("Login")
                          : Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                        height: 25,
                                        width: 25,
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 40),
                                      child: Text(
                                        "Loading....",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                    ),
                    width: double.maxFinite,
                    height: 40,
                    decoration: BoxDecoration(
                      color: greenLight,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => SignUp());
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: "Are you a new ? ", style: grenText),
                      TextSpan(text: " Register ", style: orangeText)
                    ],
                  ),
                ),
              ),
              // SizedBox(
              //   height: context.height * 0.3,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
