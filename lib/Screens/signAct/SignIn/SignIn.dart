import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/Otp/otp.dart';
import 'package:includepay/Screens/baseScreen/mainBase.dart';
import 'package:includepay/Screens/signAct/SignUp/signUp.dart';
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
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
          image: AssetImage("assets/screen2.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
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
                          padding: const EdgeInsets.only(top: 10),
                          child: FaIcon(
                            FontAwesomeIcons.phoneAlt,
                            color: greenLight,
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
                        labelStyle: TextStyle(color: greenLight),
                        hintText: "Enter Phone Number",
                        hintStyle: hintStyle,
                      ),
                      onSaved: (value) {
                        contro.phoneNum = value!;
                      },
                      validator: (String? value) {
                        return contro.validatePhone(value);
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: contro.passwordController,
                      obscureText: true,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: FaIcon(
                            FontAwesomeIcons.lock,
                            color: greenLight,
                          ),
                        ),
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: FaIcon(
                            FontAwesomeIcons.solidEyeSlash,
                            color: greenLight,
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
                        labelStyle: TextStyle(color: greenLight),
                        hintText: "Enter your password please",
                        hintStyle: hintStyle,
                      ),
                      validator: (String? value) {
                        return contro.validatePassword(value);
                      },
                      onSaved: (String? value) {
                        contro.paswKey = value!;
                        print(value);
                      },
                    )
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
                    // Get.to(() => BaseView());
                    if (contro.validate() == "Correct") {
                      print("Form correct ....");
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
                      TextSpan(text: "Are you a new member? ", style: grenText),
                      TextSpan(text: " Register", style: orangeText)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
