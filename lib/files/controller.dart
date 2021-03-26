// This file contains all business logic related to serve static files on the server

import 'dart:io';

import 'package:dart_shelf_server_sample/config/constants.dart';
import 'package:dart_shelf_server_sample/helpers/helpers.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

class FileController {
  dynamic find() {
    /// List of all the static files available in the server directory
    var dir = Directory('$fileDir');
    var files = dir.listSync(recursive: true).map((file) {
      if (file is File) return file.path;
    }).toList();
    files.removeWhere((value) => value == null);

    return Response.ok(toJson(files), headers: {'Content-Type': 'application/json'});
  }

  Handler findOne() {
    return createStaticHandler(fileDir);
  }
}
