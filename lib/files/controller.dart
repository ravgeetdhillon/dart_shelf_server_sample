// This file contains all business logic related to serve static files on the server

import 'package:dart_shelf_server_sample/config/constants.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_static/shelf_static.dart';

class FileController {
  Handler findOne() {
    return createStaticHandler(fileDir);
  }
}
