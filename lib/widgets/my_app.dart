

import 'package:ept_mate/api_manager/api_manager.dart';
import 'package:ept_mate/model/FastTripPlan.dart';
import 'package:ept_mate/screens/Meusem_of_IslamicArt_IteractiveMap/iteractiveMap_meusem_of_islamicArt.dart';

import 'package:ept_mate/screens/readyTrips/readytrip.dart';
import 'package:ept_mate/weather/view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/UserModel.dart';
import '../screens/Add_places/find_places.dart';
import '../screens/Amanda_tempel_interactiveMap/interactiveMap_AmandaTemple.dart';
import '../screens/Coptic_Meusem_InteractiveMap/interactiveMap_copticMeusem.dart';
import '../screens/InteractiveMap/interactive_map.dart';
import '../screens/abo_sample_interactiveMap/interactiveMap_aboSample.dart';
import '../screens/categories/cultural/Religious_categ.dart';
import '../screens/categories/cultural/cultural_categ.dart';
import '../screens/categories/cultural/leisure_categ.dart';
import '../screens/categories/cultural/medical_categ.dart';
import '../screens/city_res_cat.dart';
import '../screens/confirm_email/Confirm_Email.dart';
import '../screens/customize_screen/Select_Category/Select_Category_Screen.dart';
import '../screens/customize_screen/create_trip/create_trip_screen.dart';
import '../screens/date_screen/date_screen.dart';
import '../screens/days_counter/days_counter.dart';
import '../screens/details_place/place_detail.dart';
import '../screens/details_place/place_disc.dart';
import '../screens/fastTrip/FastTrip.dart';
import '../screens/fastTrip/number of placesFastTrip.dart';
import '../screens/favourte_screen/favourite_Screen.dart';
import '../screens/forget_password.dart';
import '../screens/home.dart';
import '../screens/mohamed_ali_interactiveMap/interactiveMap_mohamedAli.dart';
import '../screens/onboarding_screen.dart';
import '../screens/plan_type_screen/plan_type.dart';
import '../screens/readyTrips/number of places.dart';
import '../screens/request_ride/ride_request.dart';
import '../screens/select_city/Select_City_Screen.dart';
import '../screens/sing_in.dart';
import '../screens/sing_up.dart';
import '../screens/tabs/tripPlans_tab.dart';

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

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
          initialRoute:isLoggedIn ? HomeScreen.routeName : OnBoarding.routeName ,
          routes: {
            OnBoarding.routeName: (context) => const OnBoarding(),
            SingUp.routeName: (context) => const SingUp(),
            SingIn.routeName: (context) => const SingIn(),
            HomeScreen.routeName: (context) => const HomeScreen(),
            ForgetPasswordScreen.routeName: (context) =>
                const ForgetPasswordScreen(),
            PlanType.routeName: (context) => const PlanType(),
            CreateTrip.routeName: (context) => const CreateTrip(),
            //SelectCategory.routeName: (context) =>   const SelectCategory(categoryId: '',),
            CulturalCateg.routeName: (context) => const CulturalCateg(),
            LeisureCateg.routeName: (context) => const LeisureCateg(),
            MedicalCateg.routeName: (context) => const MedicalCateg(),
            ReligiousCateg.routeName: (context) => const ReligiousCateg(),
            //DateScreen.routeName: (context) =>   const DateScreen(),
            FavouriteScreen.routeName: (context) => const FavouriteScreen(),
            //Add_places.routeName: (context) => Add_places(),
            //DaysCounter.routeName: (context) => DaysCounter(),
            PlaceDic.routeName: (context) => PlaceDic(),
            TripPlansTab.routeName: (context) => TripPlansTab(),
            //SelectCity.routeName: (context) =>    SelectCity(),
            PlaceDicrip.routeName: (context) => PlaceDicrip(PlaceId: '',),
            RideRiquest.routeName: (context) => RideRiquest(),
            weatherView.routeName: (context) => weatherView(),
            SelectCategory.routeName: (context) => SelectCategory(
                  CategoryId: '',
                ),
            CityResCat.routeName: (context) => CityResCat(
                  categoryId: '',
                ),
            Readymade.routeName: (context) => Readymade(),
            InteractiveMap.routeName: (context) => InteractiveMap(),
            InteractiveMapAboSample.routeName: (context) => InteractiveMapAboSample(),
            InteractiveMapMohamedAli.routeName: (context) => InteractiveMapMohamedAli(),
            InteractiveMapCopticMeusem.routeName: (context) => InteractiveMapCopticMeusem(),
            InteractiveMapAmanda.routeName: (context) => InteractiveMapAmanda(),
            InteractiveMapMeusemOfIslamicArt.routeName: (context) => InteractiveMapMeusemOfIslamicArt(),
            NumOfPlaceReadyTrip.routeName: (context) => NumOfPlaceReadyTrip(id: 0,),
            NumOfPlaceFastTrip.routeName: (context) => NumOfPlaceFastTrip(id: 0,),
            //DaysCounter.routeName: (context) => const DaysCounter(),
            //Places_By_cat_And_City.routeName: (context) => Places_By_cat_And_City(),
            FastTrip.routeName:(context)=>FastTrip(),
            EmailConfirmationScreen.routeName:(context)=>EmailConfirmationScreen()
          },
        );
      },
    );
  }
}
