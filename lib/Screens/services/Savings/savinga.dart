import 'package:flutter/material.dart';
import 'package:includepay/Screens/services/Savings/savingController.dart';
import '/tools/colors.dart';
import '/tools/textStyles.dart';
import '/tools/widgets.dart';
import 'package:get/get.dart';

class Savings extends StatelessWidget {
  Savings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text("New Savings"),
          backgroundColor: greenLight,
          elevation: 0,
        ),
        body: SavingsViews());
  }
}

class SavingsViews extends StatelessWidget {
  SavingsViews({Key? key}) : super(key: key);
  final _contro = Get.put(SavingsContro());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Card(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("Please enter in details"),
                        ],
                      ),
                    ),
                    dv,
                    Form(
                      key: _contro.savingDepositingsForm,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.5,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Search Sacco name",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;style: TextStyle(color: Colors.white)
                                // print(value);
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.5,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.5,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Enter phone number",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Account number",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Amount",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Mobile Money Number",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              style: TextStyle(color: Colors.white),
                              // controller: contro.passwordController,

                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),

                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: textBoarderColor,
                                    width: 0.6,
                                  ),
                                ),
                                // labelText: "Password",
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Reason",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                // return contro.validatePassword(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          MaterialButton(
                            color: themeOrange,
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              "Back",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          SizedBox(
                            width: context.width * 0.04,
                          ),
                          MaterialButton(
                            color: greenLight,
                            onPressed: () {
                              _contro.deposit();
                              // Get.to(Succees());
                            },
                            child: Text(
                              "Save",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
