import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/screens/on_boarding/onboarding_screen.dart';

class StartingScreen extends StatefulWidget {
  const StartingScreen({super.key});

  @override
  State<StartingScreen> createState() => _StartingScreenState();
}

class _StartingScreenState extends State<StartingScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: Container(
        height: media.height,
        width: media.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: Tcolor.secondryGradient,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Strongify',
              style: TextStyle(
                  color: Tcolor.black,
                  fontSize: 45,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              'Everybody Can Train',
              style: TextStyle(color: Tcolor.white),
            ),
            const Spacer(),
            SafeArea(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: RoundButton(
                      title: "Get started",
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OnBoardingScreen()));
                      })),
            )
          ],
        ),
      ),
    );
  }
}
