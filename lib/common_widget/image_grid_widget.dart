import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:strongify/common/color_extension.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/screens/photo_progress/pagepreview.dart';

// ignore: must_be_immutable
class ImageGridWidget extends StatelessWidget {
  final String month;
  List<Photo>? list = [];
  final String imagepath;
  final VoidCallback onTap;

  ImageGridWidget({
    super.key,
    required this.month,
    this.list,
    required this.imagepath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            month,
            style: TextStyle(color: Tcolor.gray, fontSize: 12),
          ),
        ),
        SizedBox(
          height: 100,
          child: list == null || list!.isEmpty
              ? Center(
                  child: Text(
                    'No images available',
                    style: TextStyle(color: Tcolor.gray),
                  ),
                )
              : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.zero,
                  itemCount: list!.length,
                  itemBuilder: (context, indexRow) {
                    final imageInfo = list![indexRow];

                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 100,
                      decoration: BoxDecoration(
                        color: Tcolor.lightGray,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => PreviewPage(
                                      picture: XFile(imageInfo.imagepath),
                                      imagepath: imagepath,
                                    )));
                          },
                          child: Image.file(
                            File(imageInfo.imagepath),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
