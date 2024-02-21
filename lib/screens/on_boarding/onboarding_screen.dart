import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/on_boarding_page.dart';
import 'package:strongify/screens/login/signup_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int selectPage = 0;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  List<Map<String, String>> pageArr = [
    {
      "title": 'Track Your Goal',
      "subtitle":
          "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
      "image": "assets/img/on_1.png"
    },
    {
      "title": 'Get Burn',
      "subtitle":
          "Lets keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
      "image": "assets/img/On_2.png"
    },
    {
      "title": 'Eat Well',
      "subtitle":
          "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
      "image": "assets/img/on_3.png"
    },
    {
      "title": 'Improve Sleep \n  Quality',
      "subtitle":
          "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
      "image": "assets/img/on_4.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index];
              return OnBoardingPage(pObj: pObj);
            },
          ),
          Positioned(
            top: 20,
            right: 20,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: Text(
                'Skip',
                style: TextStyle(color: Tcolor.primaryColor1),
              ),
            ),
          ),
          SizedBox(
            width: 120,
            height: 120,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 70,
                  height: 70,
                  child: CircularProgressIndicator(
                    value: selectPage / 3,
                    strokeWidth: 2,
                    color: Tcolor.primaryColor1,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Tcolor.primaryColor1,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: IconButton(
                    onPressed: () {
                      if (selectPage < 3) {
                        selectPage = selectPage + 1;
                        controller.animateToPage(selectPage,
                            duration: const Duration(microseconds: 600),
                            curve: Curves.bounceIn);
                        controller.jumpToPage(selectPage);
                        setState(() {});
                      } else {
                        //welcome screen
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignUpScreen()));
                        // ignore: avoid_print
                        print('open welcome screen');
                      }
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: Tcolor.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
