import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressUtil {
  Future<void> compressPath(String path) async {
    FlutterImageCompress.compressWithFile(
      path,
      quality: 50,
    ).then((value) {
      File compressFile = File(path);
      compressFile.writeAsBytesSync(value);
    });
  }
}
