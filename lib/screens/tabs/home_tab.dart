import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../city_res_cat.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager .getCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        }

        final cate = snapshot.data?.data ?? [];
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Find Your category",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                  onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (_)=> CityResCat(categoryId:cate[0].id.toString())));
                  },
                  child: Image.network(cate[0].imageLink ?? "")),
              SizedBox(
                height: 7.h,
              ),
              Text(
                cate[0].name ?? "",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> CityResCat(categoryId:cate[1].id.toString())));
                      },
                      child: Image.network(cate[1].imageLink ?? ""),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child:  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_)=> CityResCat(categoryId:cate[2].id.toString())));
                      },
                      child: Image.network(cate[2].imageLink ?? ""),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    cate[1].name ?? "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text(
                    cate[2].name ?? "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),

            ]),
          ),
        );
      },
    );
  }
}