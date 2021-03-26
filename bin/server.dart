// This file relates to the main server
// This file is hot reloaded using nodemon

import 'package:dart_shelf_server_sample/config/constants.dart';
import 'package:dart_shelf_server_sample/config/routes.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> args) async {
  var app = routes();
  var server = await io.serve(app, hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
