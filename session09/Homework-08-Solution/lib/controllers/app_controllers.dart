// ===========================================================================
// app_controllers.dart  —  NEW (homework solution, task 2)
// ---------------------------------------------------------------------------
// One container + one provider for ItemController, same pattern as
// taskProvider in the To-Do app.
// ===========================================================================

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'item_controller.dart';

ProviderContainer appcontainer = ProviderContainer();

final itemProvider = ChangeNotifierProvider<ItemController>(
  (ref) => ItemController(),
);
