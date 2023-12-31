import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/data/child_data.dart';
import 'package:fun_nance_rewritten/core/models/child.dart';

class ChildListNotifier extends StateNotifier<List<Child>> {
  ChildListNotifier() : super(childList);

  void addChild(Child child) {
    state = [...state, child];
  }
}

final childListProvider = StateNotifierProvider<ChildListNotifier, List<Child>>(
  (ref) => ChildListNotifier(),
);
