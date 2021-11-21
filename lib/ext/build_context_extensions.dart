import 'package:flutter/material.dart';

extension BuildContextExtensions on BuildContext {
  T getArgumentByKey<T>(String key) {
    var args = ModalRoute.of(this)!.settings.arguments as Map<String, T>;
    return args[key] as T;
  }

  T getArgument<T>() {
    return ModalRoute.of(this)!.settings.arguments as T;
  }
}
