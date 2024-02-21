// import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/login/login_screen.dart';

class WhatsYourGoal extends StatefulWidget {
  const WhatsYourGoal({super.key});

  @override
  State<WhatsYourGoal> createState() => _WhatsYourGoalState();
}

class _WhatsYourGoalState extends State<WhatsYourGoal> {
  CarouselController buttonCarouselController = CarouselController();
  List goalArr = [
    {
      "image": "assets/img/goal-1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/img/goal-2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I'm “skinny fat”. look thin but have\nno shape. I want to add learn\nmuscle in the right way"
    },
    {
      "image": "assets/img/goal-3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SafeArea(
          child: Stack(
        children: [
          Center(
            child: CarouselSlider(
                items: goalArr
                    .map(
                      (gObj) => Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: Tcolor.secondryGradient,
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: media.width * 0.1, horizontal: 25),
                        alignment: Alignment.center,
                        child: FittedBox(
                          child: Column(
                            children: [
                              Image.asset(
                                gObj["image"].toString(),
                                width: media.width * 0.5,
                                fit: BoxFit.fitWidth,
                              ),
                              SizedBox(
                                height: media.width * 0.1,
                              ),
                              Text(
                                gObj["title"].toString(),
                                style: TextStyle(
                                    color: Tcolor.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700),
                              ),
                              Container(
                                width: media.width * 0.1,
                                height: 1,
                                color: Tcolor.white,
                              ),
                              SizedBox(
                                height: media.width * 0.02,
                              ),
                              Text(
                                gObj["subtitle"].toString(),
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Tcolor.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                    .toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.75,
                  initialPage: 0,
                )),
          ),
          Container(
            width: media.width,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "What is your goal ?",
                  style: TextStyle(
                      color: Tcolor.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to choose a best\n program for you",
                  style: TextStyle(
                      color: Tcolor.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Spacer(),
                SizedBox(
                  height: media.width * 0.05,
                ),
                RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    }),
              ],
            ),
          )
        ],
      )),
    );
  }
}
