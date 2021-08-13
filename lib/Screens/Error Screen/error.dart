import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

Future dialog(context) async {
  await ZoomDialog(
    zoomScale: 5,
    child: Container(
      child: Text("Zoom me!"),
      color: Colors.white,
      padding: EdgeInsets.all(20),
    ),
  ).show(context);
}
