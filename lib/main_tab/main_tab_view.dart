import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/tab_button.dart';
import 'package:strongify/screens/home/home_screen.dart';
import 'package:strongify/screens/photo_progress/photo_progress_screen.dart';

import 'package:strongify/screens/profile/profile_screen.dart';
import 'package:strongify/screens/sleep_tracker/sleep_tracker_screen.dart';
import 'package:strongify/screens/workout_tracker/workout_tracker_screen.dart';

class MainTabView extends StatefulWidget {
  final int selecttab;
  const MainTabView({super.key, this.selecttab = 0});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  late int selectTab;
  @override
  void initState() {
    super.initState();
    setState(() {
      selectTab = widget.selecttab;
    });
  }

  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      bottomNavigationBar: BottomAppBar(
          color: Tcolor.white,
          child: SizedBox(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TabButton(
                    icon: "assets/img/home_tab.png",
                    selectIcon: "assets/img/home_tab_select.png",
                    isActive: selectTab == 0,
                    onTap: () {
                      selectTab = 0;
                      currentTab = const HomeScreen();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/img/activity_tab.png",
                    selectIcon: "assets/img/activity_tab_select.png",
                    isActive: selectTab == 1,
                    onTap: () {
                      selectTab = 1;
                      currentTab = const WorkoutTrackerScreen();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/img/camera_tab.png",
                    selectIcon: "assets/img/camera_tab_select.png",
                    isActive: selectTab == 2,
                    onTap: () {
                      selectTab = 2;
                      currentTab = const PhotoProgressScreen();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/img/Bed_Add.png",
                    selectIcon: "assets/img/Sleep_select.png",
                    isActive: selectTab == 3,
                    onTap: () {
                      selectTab = 3;
                      currentTab = const SleepTrackerScreen();

                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/img/profile_tab.png",
                    selectIcon: "assets/img/profile_tab_select.png",
                    isActive: selectTab == 4,
                    onTap: () {
                      selectTab = 4;
                      currentTab = const ProfileView();

                      if (mounted) {
                        setState(() {});
                      }
                    }),
              ],
            ),
          )),
    );
  }
}
