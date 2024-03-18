import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:strongify/functions/photo_progress/camera_functions.dart';
import 'package:strongify/screens/photo_progress/pagepreview.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  void initState() {
    super.initState();
    initializeControllerFuture = initializeCamera();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 30,
      ),
      body: Stack(
        children: [
          SizedBox(
            width: media.width,
            height: media.height,
            child: FutureBuilder(
              future: initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(controller);
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.camera),
        onPressed: () async {
          try {
            await initializeControllerFuture;
            final image = await controller.takePicture();
            setState(() {
              imageFile = File(image.path);
              imageList.add(imageFile);
            });
            await saveImage(imageFile);
            // ignore: empty_catches
          } catch (e) {}

          Future.delayed(const Duration(seconds: 1), () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (ctx) => PreviewPage(
                      picture: XFile(imageFile.path),
                      imagepath: imageFile.path,
                    )));
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
