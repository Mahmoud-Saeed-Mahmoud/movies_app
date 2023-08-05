import 'dart:async' show Timer;

import 'package:flutter/material.dart' show VoidCallback;

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer(this.delay);

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(delay, action);
  }

  bool get isRunning => _timer != null && _timer!.isActive;
}
