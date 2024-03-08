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
  print('Added');
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
          print('Found an item that is not of type Photo: $item');
        }
      }
    } catch (error) {
      // Handle errors gracefully
      print('Error retrieving photos: $error');
      return null;
    }

    if (existingPhotos.isNotEmpty) {
      for (var photo in existingPhotos) {
        print(photo.toString());
      }
      return existingPhotos;
    } else {
      print('No photos found for month $month');
      return null;
    }
  } else {
    print('No photos found for month $month');
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
        } else {
          print('Image file not found: $imagePath');
        }
      } catch (error) {
        print('Error deleting photo file: $error');
      }

      await photodb.put(datakey, newPhotos);
      print('Deleted photo with path: $imagePath');
      print('Remaining photos: ${newPhotos.length}');
    } else {
      print('No photos found for month $month');
    }
  } catch (error) {
    print('Error deleting photo from Hive: $error');
  }
}
