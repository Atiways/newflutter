

import 'package:final_form/constant/values.dart';
import 'package:flutter/material.dart';
class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    Values.screenHeight=MediaQuery.of(context).size.height;
    Values.screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: Values.screenHeight*.2,
          ),

        ],
      ),
    );
  }
}
