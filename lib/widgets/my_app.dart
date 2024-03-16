

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../screens/Add_places/find_places.dart';
import '../screens/categories/cultural/Religious_categ.dart';
import '../screens/categories/cultural/cultural_categ.dart';
import '../screens/categories/cultural/leisure_categ.dart';
import '../screens/categories/cultural/medical_categ.dart';
import '../screens/city_res_cat.dart';
import '../screens/customize_screen/Select_Category/Select_Category_Screen.dart';
import '../screens/customize_screen/create_trip/create_trip_screen.dart';
import '../screens/date_screen/date_screen.dart';
import '../screens/days_counter/days_counter.dart';
import '../screens/details_place/place_detail.dart';
import '../screens/details_place/place_disc.dart';
import '../screens/favourte_screen/favourite_Screen.dart';
import '../screens/forget_password.dart';
import '../screens/home.dart';
import '../screens/onboarding_screen.dart';
import '../screens/places/place_det.dart';
import '../screens/places_By_Cat_And_City.dart';
import '../screens/plan_type_screen/plan_type.dart';
import '../screens/request_ride/ride_request.dart';
import '../screens/select_city/Select_City_Screen.dart';
import '../screens/sing_in.dart';
import '../screens/sing_up.dart';
import '../screens/tabs/location_tab.dart';


class MyApp extends StatelessWidget {


  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: OnBoarding.routeName,
          routes: {
            OnBoarding.routeName: (context) => const OnBoarding(),
            SingUp.routeName: (context) => const SingUp(),
            SingIn.routeName: (context) => const SingIn(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ForgetPasswordScreen.routeName: (context) =>
            const ForgetPasswordScreen(),
            PlanType.routeName: (context) =>   const PlanType(),
            CreateTrip.routeName: (context) =>   const CreateTrip(),
            SelectCategory.routeName: (context) =>   const SelectCategory(),
            CulturalCateg.routeName: (context) =>   const CulturalCateg(),
            LeisureCateg.routeName: (context) =>   const LeisureCateg(),
            MedicalCateg.routeName: (context) =>   const MedicalCateg(),
            ReligiousCateg.routeName: (context) =>   const ReligiousCateg(),
            DateScreen.routeName: (context) =>   const DateScreen(),
            FavouriteScreen.routeName: (context) =>   const FavouriteScreen(),
            Add_places.routeName: (context) =>    Add_places(),
            DaysCounter.routeName: (context) =>    DaysCounter(),
            PlaceDet.routeName: (context) =>    PlaceDet(),
            PlaceDic.routeName: (context) =>    PlaceDic(),
            LocationTab.routeName: (context) =>    LocationTab(),
            SelectCity.routeName: (context) =>    SelectCity(),
            PlaceDicrip.routeName: (context) =>    PlaceDicrip(),
            RideRiquest.routeName: (context) =>    RideRiquest(),
            //CityResCat.routeName: (context) =>    CityResCat(),
           // Places_By_cat_And_City.routeName: (context) => Places_By_cat_And_City(),

          },
        );
      },
    );
  }
}
