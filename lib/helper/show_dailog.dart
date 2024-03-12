import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

Future awesomeDialog(
    String title, String desc, BuildContext context, DialogType dialogType) {
  return AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: AnimType.rightSlide,
    title: title,
    desc: desc,
    //         btnCancelOnPress: () {},
    // btnOkOnPress: () {},
  ).show();
}
