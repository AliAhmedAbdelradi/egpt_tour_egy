
import 'package:flutter/material.dart';

class contain extends StatefulWidget {
  String txt;
  String x;
  Function sub;
  Function add;
  contain(this.txt,this.x, this.add,this.sub, {super.key});

  @override
  State<contain> createState() => _containState();

}

class _containState extends State<contain> {



  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(
        children: [
          SizedBox(width: 20,),
          Text(widget.txt,style: TextStyle(fontSize: 18),),
          Spacer(),
          InkWell(
            onTap: (){
              widget.sub();
            },
              child: Container(
                  margin: EdgeInsets.only(bottom: 15),
                  child: Icon(Icons.minimize))),
          SizedBox(width: 13,),
          Text("${widget.x}",),
          SizedBox(width: 13,),
          InkWell(
              onTap: (){
                widget.add();
              },

              child: Icon(Icons.add))


        ],
      ),
        height: 71,
        width: 348,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 0, color: Colors.black)));
  }

}
