import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

import 'file_pick_service.dart';

@LazySingleton(as: FilePickService)
class FilePickServiceImpl implements FilePickService {
  @override
  Future<PickedTextFile?> pickTextFile({
    required List<String> extensions,
  }) async {
    final file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: extensions,
    );
    if (file == null) return null;
    return PickedTextFile(
      name: file.name,
      content: utf8.decode(await file.readAsBytes(), allowMalformed: true),
    );
  }
}
