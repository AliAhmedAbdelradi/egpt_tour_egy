import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ShapePlanCreate extends StatelessWidget {
  ShapePlanCreate(this.img,this.txt,this.txt1 ,this.tab, {super.key});
  String img;
  String txt;
  String txt1;
  Function tab;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [

        Image(image: AssetImage(img)),
        Container(
            margin: EdgeInsets.only(top: 15,left: 20),
            child: Text(txt, style: GoogleFonts.poppins(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),)),
        Container(
            margin: EdgeInsets.only(top: 100,left: 45),
            child: Text(txt1, style: GoogleFonts.poppins(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w600),)),
        Container(
          width: 250,
          height: 40,
          margin: EdgeInsets.only(top: 140,left: 36),
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),

                  backgroundColor:
                  MaterialStatePropertyAll(Colors.white)),
              onPressed: () {},
              child: InkWell(
                onTap: () {
                  tab();
                },
                child: Row(
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                        txt,
                        style: GoogleFonts.poppins(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600)
                    ),
                  ],
                ),
              )),
        )
      ],
    );
  }
}
