import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:flutter/material.dart';

class CityResCat extends StatefulWidget {
  const CityResCat({super.key});
  static const String routeName="cityres";

  @override
  State<CityResCat> createState() => _CityResCatState();
}

class _CityResCatState extends State<CityResCat> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: FutureBuilder(
        future: ApiManger.getData(), builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        if(snapshot.hasError){
           return Center(child: Text(snapshot.error.toString()));

        }

        final cate = snapshot.data?.data??[];

        return ListView.builder(itemBuilder:  (context, index) {
          return Text( cate[index].name??"" ,style: TextStyle(color: Colors.red,fontSize: 30),);

        }
        , itemCount: cate.length
        ,);
      },),
    );
  }
}
