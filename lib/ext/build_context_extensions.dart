import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  T getArgument<T>(String key) {
    var args = ModalRoute.of(this)!.settings.arguments as Map<String, T>;
    return args[key] as T;
  }
}
