// All of the application routes are specified in the file

import 'dart:io';

import 'package:dart_shelf_server_sample/files/controller.dart';
import 'package:dart_shelf_server_sample/helpers/helpers.dart';
import 'package:dart_shelf_server_sample/posts/controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf_static/shelf_static.dart';

Router routes() {
  var app = Router();

  app.get('/', (Request request) {
    var html = File('public/index.html').readAsStringSync();
    return Response.ok(html, headers: {'Content-Type': 'text/html'});
  });

  app.get('/assets/<file>', createStaticHandler('public'));

  app.get('/api', (Request request) {
    var response = {
      'message': 'Dart API is alive',
      'api_routes': ['/posts', '/posts/{id}']
    };
    return Response.ok(toJson(response));
  });

  app.get('/posts', (Request request) {
    return PostController().find();
  });

  app.get('/posts/<id>', (Request request, String id) {
    return PostController().findOne(id);
  });

  app.get('/files', (Request request) {
    return FileController().find();
  });

  app.get('/<file>', FileController().findOne());

  return app;
}
