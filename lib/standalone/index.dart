// This file serves as an example to writing dart code which is compiled
// to javascript for the client side use using dart2js

import 'dart:html' as html;
import 'dart:async';

void main() async {
  html.querySelector('#info')?.innerHtml = 'I will be changed by Javascript';
  var count = 0;
  Timer.periodic(Duration(seconds: 1), (Timer timer) {
    html.querySelector('#info')?.innerHtml = 'I have been changed by JavaScript(actually Dart 😅) <b>$count</b> times';
    count++;
  });
}
