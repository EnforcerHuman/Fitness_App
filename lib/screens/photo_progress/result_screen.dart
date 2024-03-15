import 'dart:io';
import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_functions/photo_progress.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/functions/photo_progress/month_comparison.dart';
import '../../common_widget/round_button.dart';

class ResultScreen extends StatefulWidget {
  final int month1;
  final int month2;
  const ResultScreen({super.key, required this.month1, required this.month2});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  int selectButton = 0;
  List<Photo>? list1 = [];
  List<Photo>? list2 = [];
  String? month1;
  String? month2;

  @override
  void initState() {
    super.initState();
    getgivenmonthname();
    getresults();
  }

  @override
  Widget build(BuildContext context) {
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
          "Result",
          style: TextStyle(
              color: Tcolor.black, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () async {},
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),

              //Photo Tab UI
              if (selectButton == 0)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          month1 ?? '',
                          style: TextStyle(
                              color: Tcolor.gray,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          month2 ?? '',
                          style: TextStyle(
                              color: Tcolor.gray,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: (list1 != null &&
                              list2 != null &&
                              list1!.isNotEmpty &&
                              list2!.isNotEmpty)
                          ? (list1!.length > list2!.length
                              ? list1!.length
                              : list2!.length)
                          : 1, // Display one item to show "No images available" message
                      itemBuilder: (context, index) {
                        if (list1 == null ||
                            list2 == null ||
                            list1!.isEmpty ||
                            list2!.isEmpty ||
                            index >= list1!.length ||
                            index >= list2!.length) {
                          return Center(
                            child: Text(
                              'No images available to compare',
                              style: TextStyle(color: Tcolor.gray),
                            ),
                          );
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(
                              height: 8,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Tcolor.lightGray,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(list1![index].imagepath),
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Expanded(
                                  child: AspectRatio(
                                    aspectRatio: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Tcolor.lightGray,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Image.file(
                                          File(list2![index].imagepath),
                                          width: double.maxFinite,
                                          height: double.maxFinite,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                    ),
                    RoundButton(
                        title: "Back to Home",
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }

  void getresults() async {
    list1 = await printPhotosForMonth(widget.month1);
    list2 = await printPhotosForMonth(widget.month2);
    setState(() {});
  }

  void getgivenmonthname() {
    setState(() {
      month1 = getMonthName(widget.month1);
      month2 = getMonthName(widget.month2);
    });
  }
}
