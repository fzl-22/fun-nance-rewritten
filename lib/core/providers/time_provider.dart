import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Time extends StateNotifier<DateTime> {
  late final Timer _timer;

  Time() : super(DateTime.now()) {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = DateTime.now();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}

final timeProvider = StateNotifierProvider<Time, DateTime>(
  (ref) => Time(),
);
