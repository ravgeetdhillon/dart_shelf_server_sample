// This file relates to the main server
// Server is automatically reloaded using nodemon when the source code changes

import 'package:dart_shelf_server_sample/config/constants.dart';
import 'package:dart_shelf_server_sample/config/routes.dart';
import 'package:dart_shelf_server_sample/config/middlewares.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

void main(List<String> args) async {
  var app = routes();
  var handler = Pipeline().addMiddleware(logRequests()).addMiddleware(handleCors()).addHandler(app);
  var server = await io.serve(handler, hostname, port);
  print('Serving at http://${server.address.host}:${server.port}');
}
