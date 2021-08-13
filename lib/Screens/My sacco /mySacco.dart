import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:includepay/Screens/services/Loan/loan.dart';
import 'package:includepay/Screens/services/Transfer/transfer.dart';
import 'package:includepay/Screens/services/Withdraw/withdraw.dart';
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
        title: Text(
          "Agape Sacco",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: IconThemeData(color: greenLight),
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
                        child: Column(
                          children: [
                            Text(
                              "Profile summary",
                              style: boldHeading,
                            ),
                            Divider(
                              thickness: 0.8,
                              color: Colors.black26,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Container(
                                        child: Stack(
                                          children: [
                                            CircleAvatar(
                                              radius: 22,
                                              child: Text("JM"),
                                            ),
                                            Positioned(
                                              left: 26,
                                              top: 26,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: greenLight,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Icon(
                                                    Icons.edit,
                                                    color: Colors.white,
                                                    size: 10,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Text("John M")
                                    ],
                                  ),
                                  SizedBox(
                                    width: context.width * 0.09,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "Account Number:\n",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text:
                                                    "Account Bal:            ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: context.width * 0.1,
                                  ),
                                  Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: "25845856\n",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        FittedBox(
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "UGX 20,520",
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
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
                                  Get.to(WithDraw());
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
                                  Get.to(Transfer());
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
                                  Get.to(Loan());
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
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Recent Tranactions"),
                      dv,
                      DataTable(
                        columns: [
                          DataColumn(
                            label: Text("Activity"),
                          ),
                          DataColumn(
                            label: Text("Date"),
                          ),
                          DataColumn(
                            numeric: true,
                            label: Text("Amount"),
                          ),
                        ],
                        rows: [
                          DataRow(
                            // color: ,
                            cells: [
                              DataCell(
                                Text("Depost"),
                              ),
                              DataCell(
                                Text("2/5/2010"),
                              ),
                              DataCell(
                                Text("50,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("Withdraw"),
                              ),
                              DataCell(
                                Text("2/5/2010"),
                              ),
                              DataCell(
                                Text("20,000"),
                              ),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(
                                Text("Withdraw"),
                              ),
                              DataCell(
                                Text("2/5/2010"),
                              ),
                              DataCell(
                                Text("20,000"),
                              ),
                            ],
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: SizedBox(),
                          ),
                          Icon(
                            Icons.add,
                            color: Colors.blue,
                          ),
                          Text(
                            'More Details',
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          )
                        ],
                      )
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
