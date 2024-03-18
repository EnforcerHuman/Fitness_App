import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/db_functions.dart';
import 'package:strongify/db_functions/get_user_details.dart';
import 'package:strongify/functions/profile/userdetails.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class EditProfileSCreen extends StatefulWidget {
  const EditProfileSCreen({super.key});

  @override
  State<EditProfileSCreen> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<EditProfileSCreen> {
  TextEditingController weightcontroller =
      TextEditingController(text: weight.value);
  TextEditingController txtDatecontroller =
      TextEditingController(text: age.value);
  TextEditingController heightcontroller =
      TextEditingController(text: height.value);
  String? selectvalue;

  @override
  void initState() {
    super.initState();
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
                          onPressed: () async {
                            String gender = await getGender();
                            setState(() {
                              selectvalue = gender;
                            });
                            await edituserdetails(
                                newGender: selectvalue!,
                                newAge: int.parse(txtDatecontroller.text),
                                newWeight: int.parse(weightcontroller.text),
                                newHeight: int.parse(heightcontroller.text));
                            loaduserDetails();

                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
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
