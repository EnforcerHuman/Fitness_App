import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/functions/shared_pref.dart';
import 'package:strongify/main_tab/main_tab_view.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({
    super.key,
  });

  @override
  State<WelcomeScreen> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeScreen> {
  String? username;

  @override
  void initState() {
    super.initState();
    loadusername();
  }

  Future<void> loadusername() async {
    String loadedname = await getusername();
    setState(() {
      username = loadedname;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SafeArea(
        child: Container(
          width: media.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: media.width * 0.1,
              ),
              // Image.asset(
              //   "assets/img/welocome.png",
              //   width: media.width * 0.75,
              //   fit: BoxFit.fitWidth,
              // ),
              SizedBox(
                height: media.width * 0.1,
              ),
              Text(
                'welcome $username ',
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                "You are all set now, lets reach your\ngoals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(color: Tcolor.gray, fontSize: 12),
              ),
              const Spacer(),
              RoundButton(
                  title: "Go To Home",
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (ctx) => const MainTabView()),
                        (route) => false);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
