import 'package:flutter/material.dart';

class CategImg extends StatefulWidget {
  CategImg(this.txt1,this.img1, {super.key}) ;
  String txt1;
  String img1;

  @override
  State<CategImg> createState() => _CityImgState();
}

class _CityImgState extends State<CategImg> {
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
        width: 346,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0, color: Colors.black)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image(
                image: AssetImage(widget.img1),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              widget.txt1,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            Spacer(),
            Visibility(

                visible: isvisible,
                child: Icon(
                  Icons.done_all,
                  size: 20,
                  color: Colors.green,
                ))
          ],
        ),
      ),
    );
  }
}
