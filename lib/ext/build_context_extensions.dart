import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  String getArg(String key) {
    var args = ModalRoute.of(this)!.settings.arguments as Map<String, String>;
    return args[key] as String;
  }
}
