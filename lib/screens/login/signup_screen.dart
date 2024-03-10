import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/common_widget/round_textfield.dart';
import 'package:strongify/functions/user_registration.dart';
import 'package:strongify/screens/login/login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool isCheck = false;
  bool visibility = true;
  bool obscure = true;
  bool _showError = false;
  bool passworderror = false;
  bool nameerror = false;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void validateUserinput() {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final name = firstnameController.text.trim();
    final emailRegex = RegExp(
      r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*(\.[a-zA-Z]{2,})$',
    );

    setState(() {
      _showError = email.isEmpty || !emailRegex.hasMatch(email);
      passworderror = password.isEmpty || password.length < 4;
      nameerror = name.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    style: TextStyle(color: Tcolor.gray, fontSize: 16),
                  ),
                  Text(
                    "Create an Account",
                    style: TextStyle(
                        color: Tcolor.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  RoundTextField(
                    hintText: "First Name",
                    onChanged: (value) {
                      validateUserinput();
                    },
                    errortext: nameerror ? 'name is mandatory' : null,
                    icon: 'assets/img/Profile.png',
                    controller: firstnameController,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hintText: "Last Name (optional)",
                    icon: "assets/img/Profile.png",
                    controller: lastnameController,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hintText: 'email',
                    onChanged: (value) {
                      validateUserinput();
                    },
                    errortext: _showError
                        ? 'Please enter a valid email address'
                        : null,
                    icon: "assets/img/Message.png",
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  RoundTextField(
                    hintText: "Password",
                    onChanged: (value) {
                      validateUserinput();
                    },
                    errortext: passworderror
                        ? 'should contain minimum 4 characters'
                        : null,
                    icon: "assets/img/Lock.png",
                    controller: passwordController,
                    obscureText: obscure,
                    rigtIcon: TextButton(
                        onPressed: () {},
                        child: Container(
                            alignment: Alignment.center,
                            width: 20,
                            height: 20,
                            child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visibility = !visibility;
                                    obscure = !obscure;
                                  });
                                },
                                icon: Icon(
                                  visibility
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  size: 20,
                                  color: Tcolor.gray,
                                )))),
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCheck = !isCheck;
                          });
                        },
                        icon: Icon(
                          isCheck
                              ? Icons.check_box_outlined
                              : Icons.check_box_outline_blank_outlined,
                          color: Tcolor.gray,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          "By continuing you accept our Privacy Policy and\nTerm of Use",
                          style: TextStyle(color: Tcolor.gray, fontSize: 10),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: media.width * 0.4,
                  ),
                  RoundButton(
                    title: "Register",
                    onPressed: () {
                      validateUserinput();
                      userRegistration(
                          _showError,
                          passworderror,
                          nameerror,
                          firstnameController.text,
                          lastnameController.text,
                          emailController.text,
                          passwordController.text,
                          isCheck,
                          context);
                      // if (!_showError && !passworderror && !nameerror) {
                      //   storeSignUpDetails(
                      //       firstnameController.text,
                      //       lastnameController.text,
                      //       emailController.text,
                      //       passwordController.text);
                      //   if (!isCheck) {
                      //     showWarningDialog(context, 'ACCEPT TERMS OF USE',
                      //         'Please acccept terms of use before proceeding!',
                      //         () {
                      //       Navigator.of(context).pop();
                      //     });
                      //   } else {
                      //     Navigator.of(context).push(
                      //       MaterialPageRoute(
                      //         builder: (context) =>
                      //             const CompleteProfileSCreen(),
                      //       ),
                      //     );
                      //   }
                      // }
                    },
                  ),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  Row(
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          "Login",
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
        ),
      ),
    );
  }
}
