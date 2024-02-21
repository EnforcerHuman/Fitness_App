import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/tab_button.dart';
import 'package:strongify/main_tab/select_screen.dart';
import 'package:strongify/screens/home/home_screen.dart';
import 'package:strongify/screens/profile/profile_screen.dart';

class MainTabView extends StatefulWidget {
  const MainTabView({super.key});

  @override
  State<MainTabView> createState() => _MainTabViewState();
}

class _MainTabViewState extends State<MainTabView> {
  int selectTab = 0;

  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: PageStorage(bucket: pageBucket, child: currentTab),
      bottomNavigationBar: BottomAppBar(
          color: Tcolor.white,
          child: Container(
            // decoration: BoxDecoration(color: Tcolor.white, boxShadow: const [
            //   BoxShadow(color: Colors.black12, blurRadius: 2, offset: Offset(0, -2))
            // ]),
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
                      currentTab = const SelectScreen();
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
                      //  currentTab = const PhotoProgressView();
                      if (mounted) {
                        setState(() {});
                      }
                    }),
                TabButton(
                    icon: "assets/img/profile_tab.png",
                    selectIcon: "assets/img/profile_tab_select.png",
                    isActive: selectTab == 3,
                    onTap: () {
                      selectTab = 3;
                      currentTab = ProfileView();
                      print('profile screeen');
                      if (mounted) {
                        setState(() {});
                      }
                    })
              ],
            ),
          )),
    );
  }
}
