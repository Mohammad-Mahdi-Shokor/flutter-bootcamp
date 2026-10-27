// ===========================================================================
// app_controllers.dart  —  CHANGED IN SESSION 05
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 04:
//   Added itemsProvider for the new ItemsController. counterProvider is the
//   same. This is the pattern for every new controller: one class, plus one
//   provider here.
// ===========================================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'counter_controller.dart';
import 'items_Controller.dart'; // NEW

ProviderContainer appContainer = ProviderContainer();

final counterProvider = ChangeNotifierProvider<CounterController>(
  (ref) => CounterController(),
);

// NEW: same shape as counterProvider, written with a { return ...; } body
// instead of `=>`. Both mean the same thing.
final itemsProvider = ChangeNotifierProvider<ItemsController>((ref) {
  return ItemsController();
});
