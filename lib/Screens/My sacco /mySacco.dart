import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../services/Savings/savinga.dart';
import '/tools/textStyles.dart';
import '/tools/widgets.dart';
import '/tools/colors.dart';

class MySaccoView extends StatelessWidget {
  const MySaccoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: Text(
          "My Sacco",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        // iconTheme: IconThemeData(color: greenLight),
        backgroundColor: greenLight,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: FittedBox(
                      child: Container(
                        height: context.height * 0.18,
                        width: context.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 22,
                            child: FaIcon(
                              FontAwesomeIcons.solidUser,
                              color: greenLight,
                              size: 35,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: context.width,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Services",
                              style: boldHeading,
                            ),
                          ],
                        ),
                        dv,
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  Get.to(Savings());
                                },
                                child: FittedBox(
                                  child: iconHolder(
                                    icon: FontAwesomeIcons.coins,
                                    lebel: "Saving",
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CoolAlert.show(
                                    backgroundColor: Color(0xFFF9C404),
                                    confirmBtnColor: Color(0xFFF9C404),
                                    context: context,
                                    type: CoolAlertType.info,
                                    text: "Service coming soon",
                                  );
                                  // Get.to(WithDraw());
                                },
                                child: FittedBox(
                                  child: iconHolder(
                                    icon: FontAwesomeIcons.moneyBillAlt,
                                    lebel: "Request",
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CoolAlert.show(
                                    backgroundColor: Color(0xFFF9C404),
                                    confirmBtnColor: Color(0xFFF9C404),
                                    context: context,
                                    type: CoolAlertType.info,
                                    text: "Service coming soon",
                                  );
                                  // Get.to(Transfer());
                                },
                                child: FittedBox(
                                  child: iconHolder(
                                    icon: FontAwesomeIcons.exchangeAlt,
                                    lebel: "Transfer",
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  CoolAlert.show(
                                    backgroundColor: Color(0xFFF9C404),
                                    confirmBtnColor: Color(0xFFF9C404),
                                    context: context,
                                    type: CoolAlertType.info,
                                    text: "Service coming soon",
                                  );
                                  // Get.to(Loan());
                                },
                                child: FittedBox(
                                  child: iconHolder(
                                    icon: FontAwesomeIcons.handHoldingUsd,
                                    lebel: "Loan",
                                  ),
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
              // Card(
              //   child: Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: Column(
              //       children: [
              //         Text("Recent Tranactions"),
              //         dv,
              //         DataTable(
              //           columns: [
              //             DataColumn(
              //               label: Text("Activity"),
              //             ),
              //             DataColumn(
              //               label: Text("Date"),
              //             ),
              //             DataColumn(
              //               numeric: true,
              //               label: Text("Amount"),
              //             ),
              //           ],
              //           rows: [
              //             DataRow(
              //               // color: ,
              //               cells: [
              //                 DataCell(
              //                   Text("Depost"),
              //                 ),
              //                 DataCell(
              //                   Text("2/5/2010"),
              //                 ),
              //                 DataCell(
              //                   Text("50,000"),
              //                 ),
              //               ],
              //             ),
              //             DataRow(
              //               cells: [
              //                 DataCell(
              //                   Text("Withdraw"),
              //                 ),
              //                 DataCell(
              //                   Text("2/5/2010"),
              //                 ),
              //                 DataCell(
              //                   Text("20,000"),
              //                 ),
              //               ],
              //             ),
              //             DataRow(
              //               cells: [
              //                 DataCell(
              //                   Text("Withdraw"),
              //                 ),
              //                 DataCell(
              //                   Text("2/5/2010"),
              //                 ),
              //                 DataCell(
              //                   Text("20,000"),
              //                 ),
              //               ],
              //             )
              //           ],
              //         ),
              //         Row(
              //           children: [
              //             Expanded(
              //               child: SizedBox(),
              //             ),
              //             Icon(
              //               Icons.add,
              //               color: Colors.blue,
              //             ),
              //             Text(
              //               'More Details',
              //               style: TextStyle(
              //                 color: Colors.blue,
              //               ),
              //             )
              //           ],
              //         )
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
