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
      future: ApiManger.getCategory(),
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
            padding: const EdgeInsets.all(30),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("Discover",
                  style: GoogleFonts.poppins(color: Colors.black,
                      fontSize: 25,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10.h,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, CityResCat.routeName);
                },
                child: Container(
                    width: 500.w,
                    height: 200.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: NetworkImage(cate[0].imageLink ?? ""),
                          fit: BoxFit.cover,
                        ))),
              ),
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
                        Navigator.pushNamed(context, CityResCat.routeName);
                      },
                      child: Container(
                          width: 40.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(cate[1].imageLink ?? ""),
                                fit: BoxFit.cover,
                              ))),
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Expanded(
                    child:  InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, CityResCat.routeName);
                      },
                      child: Container(
                        width: 40.w,
                          height: 90.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(cate[2].imageLink ?? ""),
                                fit: BoxFit.cover,
                              ))),
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
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    cate[2].name ?? "",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, CityResCat.routeName);
                    },
                    child: Container(
                        width: 500.w,
                        height: 200.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: NetworkImage(cate[3].imageLink ?? ""),
                              fit: BoxFit.cover,
                            ))),
                  ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                cate[3].name ?? "",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold, fontSize: 18),
              )
            ]),
          ),
        );
      },
    );
  }
}
