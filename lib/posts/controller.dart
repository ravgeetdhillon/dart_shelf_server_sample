// This file contains all business logic related to the posts

import 'dart:io';

import 'package:dart_shelf_server_sample/config/constants.dart';
import 'package:dart_shelf_server_sample/helpers/helpers.dart';
import 'package:dart_shelf_server_sample/posts/model.dart';
import 'package:shelf/shelf.dart';

class PostController {
  dynamic find() {
    /// List of all the posts
    var posts = File('$baseApiUrl/posts.json').readAsStringSync();
    return Response.ok(posts);
  }

  dynamic findOne(String id) {
    /// List of a specific posts identified by the id
    var posts = fromJson(File('$baseApiUrl/posts.json').readAsStringSync());
    posts = posts.map((post) => Post.fromJson(post)).toList();
    var post = posts.firstWhere((post) {
      return post.id == int.parse(id);
    }, orElse: () => null);
    if (post == null) {
      return Response.notFound('Not Found');
    }
    return Response.ok(post.toJsonString(), headers: {'Content-Type': 'application/json'});
  }
}
