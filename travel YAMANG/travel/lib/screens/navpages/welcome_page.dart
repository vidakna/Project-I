import 'package:flutter/material.dart';
import 'package:travel/misc/colors.dart';

import 'package:travel/widgets/travel_blog.dart';

import '../../widgets/app_large_text.dart';
import '../../widgets/app_text.dart';
import '../../widgets/responsive_button.dart';
import 'homescreen.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img9.jpeg",
    "img8.jpeg",
    "4.jpeg",
  ];
  // List text=[
  //   "hhhhhhhhhhhh",

  //   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigationDrawer(),
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (_, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("img/" + images[index]),
                    fit: BoxFit.cover),
              ),
              child: Container(
                margin: const EdgeInsets.only(top: 150, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppLargeText(
                          text: "Trips with ",
                          size: 45,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        AppText(
                          text: "යmang",
                          size: 40,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                          width: 250,
                          child: AppText(
                            text:
                                "   Mountain hikes give you an incridible sense of freedom along with endurance test !!!",
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        RaisedButton(
                          padding: EdgeInsets.only(left: 30, right: 30),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SHomePage()),
                            );
                          },
                          child: Text(
                            'Lets Travel >>>',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Color.fromARGB(255, 14, 107, 119),
                        ),
                        // ResponsiveButton(
                        //   width: 195,

                        // )
                      ],
                    ),
                    Column(
                        children: List.generate(
                            3,
                            (indexDots) => Container(
                                  margin: const EdgeInsets.only(bottom: 2),
                                  width: 8,
                                  height: index == indexDots ? 25 : 8,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: index == indexDots
                                          ? AppColors.mainColor
                                          : AppColors.mainColor
                                              .withOpacity(0.3)),
                                )))
                  ],
                ),
              ),
            );
          }),
    );
  }
}
