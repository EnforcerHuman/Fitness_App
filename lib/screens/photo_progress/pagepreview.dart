import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final String imagepath;
  const PreviewPage(
      {super.key, required this.picture, required this.imagepath});

  final XFile picture;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            width: media.width,
            height: media.height,
            child:
                Image.file(File(picture.path), fit: BoxFit.cover, width: 250),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.amber,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
