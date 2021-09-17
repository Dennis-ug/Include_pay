import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:includepay/Screens/services/Savings/savingController.dart';
import 'package:includepay/Universials/searches.dart';
import 'package:includepay/jsonConvter/saccoSearch.dart';
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      key: _contro.savingDepositingsForm,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                            TypeAheadFormField<Sacco>(
                              onSaved: (value) {},
                              validator: (value) {
                                _contro.required(value);
                              },
                              textFieldConfiguration: TextFieldConfiguration(
                                  controller: _contro.saconame,
                                  autofocus: false,
                                  keyboardType: TextInputType.name,
                                  decoration: InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        // color: Theme.of(context).primaryColor,
                                        width: 1,
                                      ),
                                    ),
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
                                    //helperText:
                                    //"Enter a number that is registered on mobile money",
                                    labelText: 'Search Sacco',
                                    labelStyle: TextStyle(
                                        //color: Theme.of(context).primaryColor,
                                        ),
                                  )),
                              suggestionsCallback: (pattern) async {
                                return await saccoSearch(pattern);
                              },
                              onSuggestionSelected: (data) {
                                print(data);
                                _contro.saconame.text = data.name;
                                _contro.scoId = data.id;
                              },
                              itemBuilder: (context, Sacco? data) {
                                return ListTile(
                                  title: Text(data!.name),
                                  subtitle: Text(data.id),
                                );
                              },
                            ),
                            // TextFormField(
                            //   controller: _contro.reason,
                            //   style: TextStyle(color: Colors.white),
                            //   // controller: contro.passwordController,

                            //   textInputAction: TextInputAction.next,
                            //   decoration: InputDecoration(
                            //     focusedBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: textBoarderColor,
                            //         width: 0.5,
                            //       ),
                            //     ),

                            //     enabledBorder: UnderlineInputBorder(
                            //       borderSide: BorderSide(
                            //         color: textBoarderColor,
                            //         width: 0.5,
                            //       ),
                            //     ),
                            //     // labelText: "Password",
                            //     labelStyle: TextStyle(color: textBoarderColor),
                            //     hintText: "Enter phone number",
                            //     hintStyle: hintStyle,
                            //   ),
                            //   validator: (String? value) {
                            //     return _contro.validatePhone(value);
                            //   },
                            //   onSaved: (String? value) {
                            //     // contro.paswKey = value!;
                            //     // print(value);
                            //   },
                            // ),
                            TextFormField(
                              controller: _contro.accountNumaber,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                focusColor: Colors.black,
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
                                labelStyle: TextStyle(color: textBoarderColor),
                                hintText: "Account number",
                                hintStyle: hintStyle,
                              ),
                              validator: (String? value) {
                                return _contro.required(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _contro.amount,
                              // style: TextStyle(color: Colors.white),
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
                                return _contro.required(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: _contro.phoneNumber,
                              // style: TextStyle(color: Colors.white),
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
                                return _contro.validatePhone(value);
                              },
                              onSaved: (String? value) {
                                // contro.paswKey = value!;
                                // print(value);
                              },
                            ),
                            TextFormField(
                              controller: _contro.reason,
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
                                return _contro.required(value);
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
                    Obx(
                      () => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: !_contro.isLoading.value
                            ? Row(
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
                                      _contro.validate();
                                      // if (sts == "Correct") _contro.deposit();

                                      // saccoSearch("M");
                                      // List d =saccoSearch;
                                      // print(saccoSearch("M"));
                                    },
                                    child: Text(
                                      "Save",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ],
                              )
                            : CircularProgressIndicator(
                                color: greenLight,
                              ),
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
