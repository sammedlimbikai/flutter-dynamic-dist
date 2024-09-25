import 'dart:io';

import 'package:archive/archive.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

class FireBaseStorage {
  static late final FirebaseStorage _storage;
  static Logger log = Logger();
  static Future<void> initFireStore() async {
    _storage = FirebaseStorage.instance;
  }

  static Future<void> getWebAppDist() async {
    try {
      _storage = FirebaseStorage.instance;
      final fileRef = _storage
          .ref()
          .child('angular_distributions/dist_uat_21sep2024_2039pm.zip');
      Directory cacheDir = await getTemporaryDirectory();
      File zipFile = File('${cacheDir.path}/angular_dist.zip');
      await fileRef.writeToFile(zipFile);

      // List<int> bytes = zipFile.readAsBytesSync();
      // Archive archive = ZipDecoder().decodeBytes(bytes);
      // for (var file in archive) {
      //   if (file.isFile) {
      //     String filePath = '${cacheDir.path}/${file.name}';
      //     File extractedFile = File(filePath);
      //     await extractedFile.writeAsBytes(file.content);
      //   }
      // }
    } catch (e) {
      log.log(Level.info, "Error geting angular dist : ${e.toString()}");
    }
  }
}
