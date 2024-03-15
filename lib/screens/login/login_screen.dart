// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/common_widget/round_textfield.dart';
import 'package:strongify/functions/shared_pref.dart';
import 'package:strongify/screens/login/signup_screen.dart';
import 'package:strongify/screens/login/welcome_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  TextEditingController mailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool isCheck = false;
  bool checkcrential = true;
  String nullentry = '';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SafeArea(
        child: Container(
          height: media.height * 0.9,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Hey there,",
                style: TextStyle(color: Tcolor.gray, fontSize: 16),
              ),
              Text(
                "Welcome Back",
                style: TextStyle(
                    color: Tcolor.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: media.width * 0.05,
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              RoundTextField(
                controller: mailcontroller,
                hintText: "Email",
                icon: "assets/img/Message.png",
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              RoundTextField(
                controller: passwordcontroller,
                hintText: "Password",
                icon: "assets/img/Lock.png",
                obscureText: true,
                rigtIcon: TextButton(
                    onPressed: () {},
                    child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.visibility_off)))),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    checkcrential ? nullentry : 'invalid credentials',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 10,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              const Spacer(),
              RoundButton(
                  title: "Login",
                  onPressed: () async {
                    bool islogged = await checkLogin(mailcontroller.text.trim(),
                        passwordcontroller.text.trim());
                    if (islogged) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => const WelcomeScreen()));
                    } else {
                      setState(() {
                        checkcrential = false;
                        if (checkcrential) {
                          nullentry = 'please enter credentials';
                        }
                      });
                    }
                  }),
              SizedBox(
                height: media.width * 0.04,
              ),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.,
                children: [
                  Expanded(
                      child: Container(
                    height: 1,
                    color: Tcolor.gray.withOpacity(0.5),
                  )),
                  Text(
                    "  Or  ",
                    style: TextStyle(color: Tcolor.black, fontSize: 12),
                  ),
                  Expanded(
                      child: Container(
                    height: 1,
                    color: Tcolor.gray.withOpacity(0.5),
                  )),
                ],
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (ctx) => const SignUpScreen()),
                      (route) => false);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Don't have an account yet? ",
                      style: TextStyle(
                        color: Tcolor.black,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = LinearGradient(
                            colors: Tcolor.secondryGradient,
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(
                              const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: media.width * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
