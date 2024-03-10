import 'dart:io';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart' show join;
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:strongify/db_functions/photo_progress.dart';
import 'package:strongify/db_model/model.dart';

late CameraController controller;
late Future<void> initializeControllerFuture;
late File imageFile;
final List<File> imageList = [];

Future<void> initializeCamera() async {
  List<CameraDescription> cameras = await availableCameras();
  controller = CameraController(
    cameras[0],
    ResolutionPreset.medium,
  );
  await controller.initialize();
}

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  final photoProgressDirectory = join(directory.path, 'photoprogress');
  await Directory(photoProgressDirectory).create(recursive: true);
  return photoProgressDirectory;
}

Future<void> saveImage(File image) async {
  int month = DateTime.now().month;
  final path = await localPath;
  final imagePath = join(path, '${DateTime.now().millisecondsSinceEpoch}.png');
  await image.copy(imagePath);
  final photo = Photo(imagePath, month);
  storePhotos(photo);
}
