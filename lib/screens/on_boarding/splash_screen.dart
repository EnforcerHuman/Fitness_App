import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/screens/login/welcome_screen.dart';
import 'package:strongify/screens/on_boarding/starting_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool islogged = true;
  @override
  void initState() {
    super.initState();
    logged();
  }

  Future<void> logged() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      islogged = pref.getBool('islogged') ?? false;
    });
    if (islogged) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const WelcomeScreen()),
          (route) => false);
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const StartingScreen()),
          (route) => false);
    }
  }

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
          ],
        ),
      ),
    );
  }
}
