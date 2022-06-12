import 'package:final_form/constant/colors.dart';
import 'package:final_form/constant/image.dart';
import 'package:final_form/constant/string_fata.dart';
import 'package:final_form/constant/values.dart';
import 'package:final_form/screens/home.dart';
import 'package:final_form/screens/registration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  List data = [
    {
      "title": StringData.pageOneTitles,
      "subtitles": StringData.pageOneSubTitles,
      "image": Images.one
    },
    {
      "title": StringData.pageTwoTitles,
      "subtitles": StringData.pageTwoSubTitles,
      "image": Images.two
    },
    {
      "title": StringData.pageThreeTitles,
      "subtitles": StringData.pageThreeSubTitles,
      "image": Images.three
    },
  ];
  double currentPage = 0;

  void changePage(index) {
    setState(() {
      currentPage = index.toDouble();
    });
  }

  @override
  Widget build(BuildContext context) {
    Values.screenHeight = MediaQuery.of(context).size.height;
    Values.screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index)=> changePage(index),
              children: List.generate(
                  data.length,
                  (index) => pages(
                      title: data[index]['title'],
                      subtitle: data[index]['subtitles'],
                      image: data[index]['image']))),
          Positioned(
              bottom: Values.screenHeight * .15,
              left: Values.screenWidth  *.45,
              child:currentPage==data.length-1? button(): Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:
                    List.generate(data.length, (index) => dot(index)),
              ))
        ],
      ),
    );
  }

  Column pages({String? title, String? subtitle, String? image}) {
    return Column(
      children: [
        SizedBox(
          height: Values.screenHeight * .15,
        ),
        Center(
          child: CircleAvatar(
              // backgroundColor: Mycolor.white,
              backgroundImage: AssetImage(image!),
              radius: Values.screenWidth * .35),
        ),
        Padding(
          padding: EdgeInsets.only(top: Values.screenHeight * .1),
          child: Text(
            title!,
            style: TextStyle(
                fontSize: 24,
                color: Mycolor.deepBlue,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
          child: Text(
            subtitle!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Mycolor.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //SizedBox(height: Values.screenHeight*.08,),
      ],
    );
  }

  Padding dot(index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: CircleAvatar(
        backgroundColor: index == currentPage ? Mycolor.blue : Mycolor.grey,
        radius: index == currentPage? 5:3,
      ),
    );
  }
  Center button(){
    return Center(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> register()));
            }, child: Text("Let's Start"),
              style: ElevatedButton.styleFrom(
                  primary: Mycolor.pink,
                  onPrimary: Mycolor.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  )
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
            }, child: Text("Log in",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
              style: ElevatedButton.styleFrom(
                  primary: Mycolor.grey,
                  onPrimary: Mycolor.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32)
                  )
              ),
            ),
          ),
        ],
      ) ,
    );
  }

}
