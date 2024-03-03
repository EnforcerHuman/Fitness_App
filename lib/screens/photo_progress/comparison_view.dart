import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/round_button.dart';
import 'package:strongify/functions/photo_progress/month_comparison.dart';
import 'package:strongify/screens/photo_progress/result_screen.dart';

class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
  var list = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'Augst',
    'September',
    'October',
    'November',
    'December'
  ];
  String firstmonth = 'January';
  String secondmonth = 'January';
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Tcolor.white,
        centerTitle: true,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            height: 40,
            width: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: Tcolor.lightGray,
                borderRadius: BorderRadius.circular(10)),
            child: Image.asset(
              "assets/img/black_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Comparison",
          style: TextStyle(
              color: Tcolor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8),
              height: 40,
              width: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Tcolor.lightGray,
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                "assets/img/more_btn.png",
                width: 15,
                height: 15,
                fit: BoxFit.contain,
              ),
            ),
          )
        ],
      ),
      backgroundColor: Tcolor.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: media.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Tcolor.gray.withOpacity(0.06)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            Image(image: AssetImage('assets/img/Calendar.png')),
                      ),
                    ),
                    const Text('Select month 1'),
                    DropdownButton<String>(
                      underline: Container(),
                      value: firstmonth,
                      icon: const Icon(Icons.keyboard_arrow_right),
                      items: list.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          firstmonth = newValue!;
                          print(firstmonth);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: Container(
                width: media.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Tcolor.gray.withOpacity(0.06)),
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 12),
                      child: SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            Image(image: AssetImage('assets/img/Calendar.png')),
                      ),
                    ),
                    const Text('Select month 2'),
                    DropdownButton<String>(
                      underline: Container(),
                      value: secondmonth,
                      icon: const Icon(Icons.keyboard_arrow_right),
                      items: list.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          secondmonth = newValue!;
                          print(secondmonth);
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            RoundButton(
                title: "Compare",
                onPressed: () {
                  int month1 = getMonthValue(firstmonth);
                  int month2 = getMonthValue(secondmonth);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        month1: month1,
                        month2: month2,
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}
