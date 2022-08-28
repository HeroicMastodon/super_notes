import 'dart:async';

import 'package:flutter/material.dart';

class Debouncer {
  final Duration duration;
  Timer? _timer;

  Debouncer({this.duration = const Duration(milliseconds: 500)});

  run(VoidCallback action, [VoidCallback? beforeAction]) {
    beforeAction?.call();

    _timer?.cancel();
    _timer = Timer(duration, action);
  }

  dispose() {
    _timer?.cancel();
  }
}