import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/functions/Home/water_steps_function.dart';
import 'package:strongify/functions/activity_tracker_functions.dart';
import 'package:strongify/main_tab/main_tab_view.dart';
import '../../common_widget/round_button.dart';
import '../../common_widget/round_textfield.dart';

class SetTargetSCreen extends StatefulWidget {
  const SetTargetSCreen({super.key});

  @override
  State<SetTargetSCreen> createState() => _SetTargetSCreenState();
}

class _SetTargetSCreenState extends State<SetTargetSCreen> {
  TextEditingController watertargetcontroller = TextEditingController();
  TextEditingController steptargetcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/img/set_goal.jpeg",
                  width: media.width,
                  fit: BoxFit.fitWidth,
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                Text(
                  "Set Your Goal",
                  style: TextStyle(
                      color: Tcolor.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "make a goal and achieve it!",
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
                        controller: watertargetcontroller,
                        hintText: "Water intake",
                        icon: 'assets/img/water.png',
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: RoundTextField(
                              keyboardType: TextInputType.number,
                              controller: steptargetcontroller,
                              hintText: "Steps",
                              icon: "assets/img/foot.png",
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: media.width * 0.04,
                      ),
                      SizedBox(
                        height: media.width * 0.07,
                      ),
                      RoundButton(
                          title: "Confirm",
                          onPressed: () async {
                            await savetarget(steptargetcontroller.text,
                                watertargetcontroller.text);
                            gettargets();
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (ctx) => const MainTabView()),
                                (route) => false);
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
