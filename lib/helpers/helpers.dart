import 'dart:convert';

String toJson(data) {
  return json.encode(data);
}

dynamic fromJson(data) {
  return json.decode(data);
}
