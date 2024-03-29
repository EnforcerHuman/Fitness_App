import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:strongify/db_model/model.dart';

Future<void> storePhotos(Photo value) async {
  final photodb = await Hive.openBox<List<dynamic>>('photoprogress');
  final datakey = value.month;
  List<Photo> photoformonth = [];

  if (photodb.containsKey(datakey)) {
    final existingphotos = photodb.get(datakey);
    photoformonth.addAll(existingphotos as List<Photo>);
  }

  photoformonth.add(value);
  await photodb.put(datakey, photoformonth);
}

Future<List<Photo>?> printPhotosForMonth(int month) async {
  final photodb = await Hive.openBox<List<dynamic>>('photoprogress');
  final datakey = month;

  if (photodb.containsKey(datakey)) {
    final List<Photo> existingPhotos = [];

    // Handle potential errors by wrapping in try-catch
    try {
      final data = photodb.get(datakey) ?? [];
      for (var item in data) {
        if (item is Photo) {
          existingPhotos.add(item);
        } else {
          // Handle non-Photo items (if needed)
        }
      }
    } catch (error) {
      // Handle errors gracefully

      return null;
    }

    if (existingPhotos.isNotEmpty) {
      // ignore: unused_local_variable
      for (var photo in existingPhotos) {}
      return existingPhotos;
    } else {
      return null;
    }
  } else {
    return null;
  }
}

Future<void> deletePhoto(int month, String imagePath) async {
  try {
    final photodb = await Hive.openBox<List<dynamic>>('photoprogress');
    final datakey = month;

    if (photodb.containsKey(datakey)) {
      final List existingPhotos = photodb.get(datakey) ?? [];
      final newPhotos = existingPhotos
          .where((photo) => photo.imagepath != imagePath)
          .toList();

      // Delete the file from the device storage
      try {
        final file = File(imagePath);
        if (await file.exists()) {
          await file.delete();
        } else {}
      } catch (error) {
        //
      }

      await photodb.put(datakey, newPhotos);
    } else {}
  } catch (error) {
//
  }
}
