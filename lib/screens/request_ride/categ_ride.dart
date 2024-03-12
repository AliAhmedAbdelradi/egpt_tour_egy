
import 'package:flutter/material.dart';

class CateRide extends StatefulWidget {
  CateRide(this.txt1,this.img1,this.txt2,this.txt3, {super.key}) ;
  String txt1;
  String txt2;
  String txt3;
  String img1;

  @override
  State<CateRide> createState() => _CateRideState();
}

class _CateRideState extends State<CateRide> {

  bool isvisible = true;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {
        setState(() {

        });
        isvisible=! isvisible;
      },
      child: Container(
        height: 71,
        width: 348,
        decoration: BoxDecoration(
            color: Color(0xFFF0F4F8),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(width: 0, color: Colors.transparent)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage(widget.img1),

              ),
            ),

            Container(

              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text( widget.txt1,style: TextStyle(fontSize: 12,color: Colors.black),),
                    Text( widget.txt2,style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w100),),
                    Text( widget.txt3,style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.w100),),
                  ],
                ),
              ),
            ),
            SizedBox(width: 110,),
             Visibility(
                 visible: isvisible,
                 child: Icon(Icons.done_all,size: 20,color: Colors.green,))

          ],
        ),
      ),
    );
  }
}
