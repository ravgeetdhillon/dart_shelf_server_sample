// This file contains some helper functions which are used regularly in the application

import 'dart:convert';

String toJson(data) {
  return json.encode(data);
}

dynamic fromJson(data) {
  return json.decode(data);
}
