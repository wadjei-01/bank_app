import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';

class FileUtils {
  static String formatBytes(int length, int decimals) {
    int bytes = length;
    if (bytes <= 0) return "0 B";
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return '${(bytes / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }

  static Future<void> getSingleFile(Function(File) fileList,
      {List<String>? allowedExtentions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowedExtentions != null ? FileType.custom : FileType.any,
        allowedExtensions: allowedExtentions);

    if (result != null) {
      File file = File(result.files.single.path!);
      fileList(file);
    } else {
      // User canceled the picker
    }
  }

  static Future<void> getMultipleFiles(void Function(List<File>) fileList,
      {List<String>? allowedExtentions}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: allowedExtentions != null ? FileType.custom : FileType.any,
        allowMultiple: true,
        allowedExtensions: allowedExtentions);

    if (result != null) {
      List<File> file = result.files.map((e) => File(e.path!)).toList();
      fileList(file);
    } else {
      // User canceled the picker
    }
  }
}
