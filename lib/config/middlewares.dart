// This file contains all the middlewares

import 'package:shelf/shelf.dart';

Middleware handleCors() {
  var corsHeaders = {
    'Access-Control-Allow-Origins': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE',
    'Access-Control-Allow-Headers': 'Origin, Content-Type',
  };

  return createMiddleware(requestHandler: (Request request) {
    if (request.method.toLowerCase() == 'options') {
      return Response.ok('', headers: corsHeaders);
    }
    return null;
  }, responseHandler: (Response response) {
    return response.change(headers: corsHeaders);
  });
}
