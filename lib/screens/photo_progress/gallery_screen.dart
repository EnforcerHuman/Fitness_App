import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/common_widget/image_grid_widget.dart';
import 'package:strongify/db_functions/photo_progress.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/functions/photo_progress/month_comparison.dart';
import 'package:strongify/screens/photo_progress/opencamera.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late final List<CameraDescription> cameras;
  List<Photo>? list1 = [];
  List<Photo>? list2 = [];
  List<Photo>? list3 = [];
  List<Photo>? list4 = [];
  List<Photo>? list5 = [];
  List<Photo>? list6 = [];
  List<Photo>? list7 = [];
  List<Photo>? list8 = [];
  List<Photo>? list9 = [];
  List<Photo>? list10 = [];
  List<Photo>? list11 = [];
  List<Photo>? list12 = [];
  String? month1;
  String? month2;
  String? month3;
  String? month4;
  String? month5;
  String? month6;
  String? month7;
  String? month8;
  String? month9;
  String? month10;
  String? month11;
  String? month12;

  @override
  void initState() {
    super.initState();
    getgivenmonthname();
    getimages();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Tcolor.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Gallery",
                        style: TextStyle(
                            color: Tcolor.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Go Home",
                            style: TextStyle(color: Tcolor.gray, fontSize: 12),
                          ))
                    ],
                  ),
                ),
                ImageGridWidget(
                  month: month1 ?? '',
                  imagepath: '',
                  list: list1,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month2 ?? '',
                  imagepath: '',
                  list: list2,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month3 ?? '',
                  imagepath: '',
                  list: list3,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month4 ?? '',
                  imagepath: '',
                  list: list4,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month5 ?? '',
                  imagepath: '',
                  list: list5,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month6 ?? '',
                  imagepath: '',
                  list: list6,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month7 ?? '',
                  imagepath: '',
                  list: list7,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month8 ?? '',
                  imagepath: '',
                  list: list8,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month9 ?? '',
                  imagepath: '',
                  list: list9,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month10 ?? '',
                  imagepath: '',
                  list: list10,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month11 ?? '',
                  imagepath: '',
                  list: list11,
                  onTap: () {},
                ),
                ImageGridWidget(
                  month: month12 ?? '',
                  imagepath: '',
                  list: list12,
                  onTap: () {},
                )
              ],
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CameraScreen()),
          );
        },
        child: Container(
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: Tcolor.secondryGradient),
              borderRadius: BorderRadius.circular(27.5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12, blurRadius: 5, offset: Offset(0, 2))
              ]),
          alignment: Alignment.center,
          child: Icon(
            Icons.photo_camera,
            size: 20,
            color: Tcolor.white,
          ),
        ),
      ),
    );
  }

  void getgivenmonthname() {
    setState(() {
      month1 = getMonthName(1);
      month2 = getMonthName(2);
      month3 = getMonthName(3);
      month4 = getMonthName(4);
      month5 = getMonthName(5);
      month6 = getMonthName(6);
      month7 = getMonthName(7);
      month8 = getMonthName(8);
      month9 = getMonthName(9);
      month10 = getMonthName(10);
      month11 = getMonthName(11);
      month12 = getMonthName(12);
    });
  }

  Future<void> getimages() async {
    list1 = await printPhotosForMonth(1);
    list2 = await printPhotosForMonth(2);
    list3 = await printPhotosForMonth(3);
    list4 = await printPhotosForMonth(4);
    list5 = await printPhotosForMonth(5);
    list6 = await printPhotosForMonth(6);
    list7 = await printPhotosForMonth(7);
    list8 = await printPhotosForMonth(8);
    list9 = await printPhotosForMonth(9);
    list10 = await printPhotosForMonth(10);
    list11 = await printPhotosForMonth(11);
    list12 = await printPhotosForMonth(12);
    printPhotosForMonth(3);
    setState(() {});
  }
}
