import 'package:flutter/material.dart';

import '../model/onboarding_model.dart';

Color primaryColor = const Color(0xff89C9FF);
List<OnboardingModel> content = [
  OnboardingModel(
      image: 'assets/images/water_scooter.gif',
      title: 'Egypt Coastal Adventures',
      desc:
          'Egypt\'s wonderful coasts on the Red Sea and the Mediterranean attract '
          '  beach and water sports lovers. Cities like Sharm El Sheikh '
          'and Hurghada arepopular destinations for beach and diving lovers'),
  OnboardingModel(
      image: 'assets/images/city_driver.gif',
      title: 'Landmarks Taxi Tour',
      desc:
          'You Can Request a Driver To Take You From His Plane To Your Tourist Destination to Discover the Land Marks of Egypt'),
  OnboardingModel(
      image: 'assets/images/exploring.gif',
      title: 'Discover Egypt',
      desc: 'Explore Egypt\'s Rich Heritage'
          'history and culture historical sites museums and landmarks.'),
];
