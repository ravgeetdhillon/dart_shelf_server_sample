// All of the application routes are specified in the file

import 'package:dart_shelf_server_sample/files/controller.dart';
import 'package:dart_shelf_server_sample/helpers/helpers.dart';
import 'package:dart_shelf_server_sample/posts/controller.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

Router routes() {
  var app = Router();

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

  app.get('/files/<file>', FileController().findOne());

  return app;
}
