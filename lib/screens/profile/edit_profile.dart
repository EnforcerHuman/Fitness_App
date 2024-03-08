import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/db_functions.dart';
import 'package:strongify/db_functions/get_user_details.dart';
import 'package:strongify/screens/profile/profile_screen.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class EditProfileSCreen extends StatefulWidget {
  const EditProfileSCreen({super.key});

  @override
  State<EditProfileSCreen> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileSCreen> {
  String username = 'user';
  String heightvalue = 'unvailable';
  String weightvalue = 'unavailable';
  String age = 'unavilable';
  late TextEditingController weightcontroller;
  late TextEditingController txtDatecontroller;
  late TextEditingController heightcontroller;
  String? selectvalue;
  bool ageError = false;
  bool heightError = false;
  bool weightError = false;

  Future<void> loaduserDetails() async {
    String loadedage = await getAge();
    String loadedheight = await getheight();
    String loadedweight = await getweight();
    String gender = await getGender();
    setState(() {
      age = loadedage;
      heightvalue = loadedheight;
      weightvalue = loadedweight;
      selectvalue = gender;
      weightcontroller = TextEditingController(text: weightvalue);
      txtDatecontroller = TextEditingController(text: age);
      heightcontroller = TextEditingController(text: heightvalue);
    });
  }

  @override
  void initState() {
    super.initState();
    loaduserDetails();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/complete_profile.png",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Edit  your profile",
                  style: TextStyle(
                      color: Tcolor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "It will help us to know about your changes!",
                  style: TextStyle(color: Tcolor.gray, fontSize: 12),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      RoundTextField(
                        keyboardType: TextInputType.number,
                        controller: txtDatecontroller,
                        hintText: "Age",
                        icon: "assets/img/Calendar.png",
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              keyboardType: TextInputType.number,
                              controller: weightcontroller,
                              hintText: "Your Weight",
                              icon: "assets/img/weight.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: Tcolor.secondryGradient,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "KG",
                              style:
                                  TextStyle(color: Tcolor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              keyboardType: TextInputType.number,
                              controller: heightcontroller,
                              hintText: "Your Height",
                              icon: "assets/img/height.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: Tcolor.secondryGradient,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "CM",
                              style:
                                  TextStyle(color: Tcolor.white, fontSize: 12),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(
                          title: "Confirm",
                          onPressed: () {
                            edituserdetails(
                                newGender: selectvalue!,
                                newAge: int.parse(txtDatecontroller.text),
                                newWeight: int.parse(weightcontroller.text),
                                newHeight: int.parse(heightcontroller.text));
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (ctx) => const ProfileView()));
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
