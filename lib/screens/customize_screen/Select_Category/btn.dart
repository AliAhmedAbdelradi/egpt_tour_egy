import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Btn extends StatelessWidget {
  Btn(this.col1,this.col2,this.txt,this.action, {super.key});
  Color col1;
  Color col2;
  String txt;
  Function action;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
        style: ButtonStyle(minimumSize: MaterialStatePropertyAll(Size(100, 30)),
            shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: col1,
                  width: 0,
                ))),
            backgroundColor:
            MaterialStatePropertyAll(col2)),
        onPressed: () {
          action();
        },
        child: Text(
          txt,
          style: GoogleFonts.poppins(color: col1,fontSize: 18),
        ));
  }
}
