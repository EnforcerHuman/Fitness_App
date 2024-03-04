import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:strongify/db/photo_progress.dart';
import 'package:strongify/db_model/model.dart';
import 'package:strongify/screens/photo_progress/pagepreview.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  late File _imageFile;
  final List<File> _imageList = [];

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = initializeCamera();
  }

  Future<void> initializeCamera() async {
    List<CameraDescription> cameras = await availableCameras();
    _controller = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    final photoProgressDirectory = join(directory.path, 'photoprogress');
    await Directory(photoProgressDirectory).create(recursive: true);
    return photoProgressDirectory;
  }

  Future<void> _saveImage(File image) async {
    final path = await _localPath;
    final imagePath =
        join(path, '${DateTime.now().millisecondsSinceEpoch}.png');
    await image.copy(imagePath);
    final photo = Photo(imagePath, 5);
    storePhotos(photo);
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
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return CameraPreview(_controller);
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
            await _initializeControllerFuture;
            final image = await _controller.takePicture();
            setState(() {
              _imageFile = File(image.path);
              _imageList.add(_imageFile);
            });
            await _saveImage(_imageFile);
          } catch (e) {
            print('Error taking picture: $e');
          }
          // ignore: use_build_context_synchronously
          Navigator.of(context).push(MaterialPageRoute(
              builder: (ctx) => PreviewPage(
                    picture: XFile(_imageFile.path),
                    imagepath: _imageFile.path,
                  )));
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
