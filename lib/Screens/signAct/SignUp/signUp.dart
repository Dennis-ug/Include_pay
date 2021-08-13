import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/signAct/SignIn/SignIn.dart';
import 'package:includepay/Screens/signAct/SignUp/signUpControl.dart';
import '/tools/colors.dart';
import '/tools/textStyles.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

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
  final contro = Get.put(SignUpController());

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: contro.signUpForm,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: contro.nameController,
                      obscureText: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: FaIcon(
                            FontAwesomeIcons.user,
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
                            width: 0.5,
                          ),
                        ),
                        labelText: "Name",
                        labelStyle: TextStyle(color: greenLight),
                        hintText: "Enter your name please",
                        hintStyle: hintStyle,
                      ),
                      validator: (String? value) {
                        return contro.validateName(value);
                      },
                      onSaved: (String? value) {
                        contro.name = value!;
                        print(value);
                      },
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: contro.emailController,
                      obscureText: false,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: FaIcon(
                            FontAwesomeIcons.user,
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
                            width: 0.5,
                          ),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(color: greenLight),
                        hintText: "Enter your email please",
                        hintStyle: hintStyle,
                      ),
                      validator: (String? value) {
                        return contro.validateEmail(value);
                      },
                      onSaved: (String? value) {
                        contro.email = value!;
                        print(value);
                      },
                    ),
                    TextFormField(
                      maxLength: 10,
                      style: TextStyle(color: Colors.white),
                      controller: contro.phoneController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.phone,
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
                        contro.phone = value!;
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
                    ),
                    TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: contro.confirmPasswordt,
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
                        labelText: "Confirm Password",
                        labelStyle: TextStyle(color: greenLight),
                        hintText: "Enter your password please",
                        hintStyle: hintStyle,
                      ),
                      validator: (String? value) {
                        return contro.confirmPassword(value);
                      },
                      onSaved: (String? value) {
                        //contro.paswKey = value!;
                        print("Confirmed password $value");
                      },
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  contro.validate();
                  if (contro.validate() == "correct") {
                    contro.signUp();
                  } else {
                    _dialog(
                        msg:
                            "Invalid Data entered \n or \n You have left out some fields");
                  }

                  //contro.signUp();
                },
                child: Container(
                  child: Center(
                    child: Text("Register"),
                  ),
                  width: double.maxFinite,
                  height: 40,
                  decoration: BoxDecoration(
                    color: greenLight,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(child: SizedBox()),
                  Text(
                    "Already registered?  ",
                    style: orangeText,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Text(
                      "SignIn",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void _dialog({required String msg, sc}) {
    Get.defaultDialog(
        title: "Warning",
        middleText: "$msg \n ",
        radius: 8,
        confirm: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Ok"),
        ));
  }
}
