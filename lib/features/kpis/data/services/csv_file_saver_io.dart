import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

/// Mobile/desktop: writes the CSV to a temporary file and opens the share sheet.
Future<void> saveCsvFile(String filename, String content) async {
  final directory = await getTemporaryDirectory();
  final file = File(p.join(directory.path, filename));
  await file.writeAsBytes(utf8.encode('﻿$content'), flush: true);
  await SharePlus.instance.share(
    ShareParams(files: [XFile(file.path, mimeType: 'text/csv')]),
  );
}
