import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '/tools/colors.dart';

Divider dv = Divider(
  thickness: 0.8,
  color: Colors.black26,
);
Container iconHolder({
  required icon,
  required String lebel,
}) {
  return Container(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: FaIcon(
            icon,
            // semanticLabel: "My Saco",
            color: greenLight,
            size: 30,
          ),
        ),
        //Expanded(child: SizedBox()),
        Text(
          lebel,
          style: TextStyle(color: Colors.black, fontSize: 12),
        )
      ],
    ),
  );
}

Future universalDialog({required BuildContext context, String? title}) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      content: Text("$title"),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
      ],
    ),
  );
}
